puts "Warning:  If this import fails on Windows, run 'chcp 1252' and try again."
#puts "one #{Time.now.to_s}"
require File.expand_path('../../config/environment', __FILE__)
#puts "two #{Time.now.to_s}"
require 'csv'
#puts "three #{Time.now.to_s}"


#DAY=60*60*24
DAY=1
def guess_time(base, day, time)
  tmp = DateTime.parse(time)
#  puts "   ==> tmp: #{tmp.to_s}"
  ret = DateTime.new(base.year,
                     base.month,
                     base.day,
                     tmp.hour,
                     tmp.min,
                     tmp.sec)
  # puts "   ret: ==> #{ret.to_s}"
  while (Time::RFC2822_DAY_NAME[ret.wday] != day) do
    ret = ret + DAY
    # puts "   ==> #{ret.to_s}"
  end
  # puts "   ==> #{ret.to_s}"
  ret
end

def add_time(start, duration)
  len = DateTime.parse(duration)
  start + (len - len.beginning_of_day)
end


event = Event.where("name = ?", ARGV[0]).first
puts "Got event: #{event.name}"

#puts "four #{Time.now.to_s}"
puts "Destroying presentations..."
Presentation.destroy_all
puts "Destroying slots..."
Slot.destroy_all

puts "Deleted all presentations and slots."

f = open(ARGV[1], "r:ISO-8859-1")
text = f.read()

limit = ARGV[2].nil? ? 0 : ARGV[2].to_i

CSV.parse(text, {:headers => true}) do |row|
  next if row['title'].nil?

  limit = limit - 1
  exit if limit == 0
  
  puts "Creating presentation: #{row['title']} (#{event.name})"
  
  p = Presentation.create(:name => row['title'],
    :event => event)
  c = Category.find_or_create_by_name(:name => row['track'])
  p.categories << c
  l = Location.find_or_create_by_name(:name => row['room name'])
  start = guess_time(event.start, 
                     row['day'], 
                     row['start time'])
  stop = add_time(start, row['duration'])
  s = Slot.create(:presentation => p, 
                  :location => l,
                  :start => start,
                  :stop => stop )
  #puts "    participants: [#{row['participants'].split(',').join('],[')}]" unless row['participants'].nil?
  unless row['participants'].nil?
    row['participants'].split(',').each do |participant|
      who = Person.find_or_create_by_name(participant)
      s.presenter_people << who
    end
  end
end


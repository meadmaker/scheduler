puts "one #{Time.now.to_s}"
require File.expand_path('../../config/environment', __FILE__)
puts "two #{Time.now.to_s}"
require 'csv'
puts "three #{Time.now.to_s}"

event = Event.where("name = ?", ARGV[0]).first
puts "Got event: #{event.name}"

puts "four #{Time.now.to_s}"

Presentation.delete_all
puts "Deleted all presentations."

puts "five #{Time.now.to_s}"

f = open(ARGV[1], "r:ISO-8859-1")
text = f.read()

CSV.parse(text, {:headers => true}) do |row|


# CSV.foreach(ARGV[1], {:headers => true}) do |row|
  next if row['title'].nil?
  puts "Creating presentation: #{row['title']} (#{event.name})"
  p = Presentation.create(:name => row['title'],
    :event => event)
end

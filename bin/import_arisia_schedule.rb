puts "one"
require File.expand_path('../../config/environment', __FILE__)
puts "two"
require 'csv'
puts "three"

event = Event.where("name = ?", ARGV[0]).first
puts "Got event: #{event.name}"


Presentation.delete_all
puts "Deleted all presentations."

# f = open(ARGV[1])
# text = f.read().encode("UTF-8")
# 
# CSV.parse(text, {:headers => true}) do |row|


CSV.foreach(ARGV[1], {:headers => true}) do |row|
  next if row['title'].nil?
  puts "Creating presentation: #{row['title']} (#{event.name})"
  p = Presentation.create(:name => row['title'],
    :event => event)
end

Factory.define :event do |event|
  event.name  { Faker::Company.name }
  event.start { Date.today - 2 }
  event.stop  { Date.today }
end
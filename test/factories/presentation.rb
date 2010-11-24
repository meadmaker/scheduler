Factory.define :presentation do |p|
  p.name         { Faker::Lorem.sentence }
  p.description  { Faker::Lorem.paragraph(2) }
  p.event        { Factory.create :event }
end
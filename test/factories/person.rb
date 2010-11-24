Factory.define :person do |p|
  p.name { Faker::Name.name }
end
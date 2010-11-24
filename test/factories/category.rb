Factory.define :category do |cat|
  cat.name { Faker::Name.name }
end
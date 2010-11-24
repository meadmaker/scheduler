Factory.define :location do |loc|
  loc.name { "#{Faker::Name.name} #{ (rand(500)).to_s }" }
end
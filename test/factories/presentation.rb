Factory.define :presentation do |p|
  p.name         { Faker::Lorem.sentence }
  p.description  "{ Faker::Lorem.paragraph(2) }"
  p.event        { Factory.create :event }
  
  p.after_create do |presentation|
    presentation.categories << Factory.create(:category)
  end
end
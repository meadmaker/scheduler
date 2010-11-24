Factory.define :slot do |slot|
  slot.start         { DateTime.now }
  slot.stop          { DateTime.now - 2/24 }
  slot.location      { Factory.create :location }
  slot.presentation  { Factory.create :presentation }
end
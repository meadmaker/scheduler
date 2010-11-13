class Person < ActiveRecord::Base
  
  has_many :attendees
  has_many :slots, :through => :attendees
  
  has_many :presenters
  has_many :presenting_slots, 
           :class_name => 'Slot',
           :through => :presenters
  
  has_many :audiences
  has_many :audience_slots, 
           :class_name => 'Slot', 
           :through => :audiences
  
end

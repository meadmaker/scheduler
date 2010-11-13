class Slot < ActiveRecord::Base
  belongs_to :presentation
  belongs_to :location
  
  has_many :attendees
  has_many :people, :through => :attendees
  
  has_many :presenters
  has_many :presenter_people, 
           :class_name => 'Person',
           :through => :presenters,
           :source => :person
  
  has_many :audiences
  has_many :audience_people,
           :class_name => 'Person',
           :through => :audiences,
           :source => :person
end

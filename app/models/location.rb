class Location < ActiveRecord::Base
  has_many :slots
  
  validates_uniqueness_of :name
end

class Event < ActiveRecord::Base
  has_many :presentations
  
  def to_param
    "#{id}-#{name}"
  end
end

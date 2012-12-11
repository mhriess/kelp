class Restaurant < ActiveRecord::Base
  attr_accessible :address, :city, :name, :neighborhood, :state, :zipcode
  
  validates :name,
    :presence => true,
    :length => { :maximum => 30, :minimum => 2 }
  validates :neighborhood,
    :presence => true
  validates :city,
    :presence => true
  validates :state,
    :presence => true
  validates :zipcode,
    :presence => true,
    :length => { :is => 5 }
    
end

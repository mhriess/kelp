class Restaurant < ActiveRecord::Base
  attr_accessible :address, :city, :name, :neighborhood, :state, :zipcode
end

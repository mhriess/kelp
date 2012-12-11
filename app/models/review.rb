class Review < ActiveRecord::Base
  attr_accessible :body, :restaurant_id, :reviewer
end

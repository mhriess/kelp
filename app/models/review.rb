class Review < ActiveRecord::Base
  attr_accessible :body, :restaurant_id, :reviewer, :rating
  
  validates :reviewer,
    :presence => true
  validates :body,
    :presence => true
  validates :rating,
    :presence => true
  validates :restaurant_id,
    :presence => true
  
  belongs_to :restaurant
end

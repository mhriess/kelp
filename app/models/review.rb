class Review < ActiveRecord::Base
  attr_accessible :body, :restaurant_id, :reviewer, :rating
  
  after_save :update_restaurant_rating
  
  validates :reviewer,
    :presence => true
  validates :body,
    :presence => true
  validates :rating,
    :presence => true
  validates :restaurant_id,
    :presence => true
  
  belongs_to :restaurant
  
  private
  
  def update_restaurant_rating
    self.restaurant.update_rating(self.rating)
  end
end

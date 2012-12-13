class Restaurant < ActiveRecord::Base
  attr_accessible :address, :city, :name, :neighborhood, :state, :zipcode, :rating
  
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
    
  has_many :reviews
  
  def update_rating(rating)
    self.rating == 0 ? new_rating = rating : new_rating = average_rating(rating)
    self.update_attributes(:rating => new_rating)
  end
  
  private
  
  def average_rating(review_rating)
    (self.rating + review_rating) / 2
  end
end

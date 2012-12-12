class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurants = Restaurant.all
  end
  
  def create
    @restaurant = Restaurant.find(params[:review][:restaurant_id])
    @review = @restaurant.reviews.build(params[:review])
    
    if @review.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end
end

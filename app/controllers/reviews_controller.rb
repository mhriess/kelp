class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurants = Restaurant.all
  end
  
  def create
    @review = Review.new(params[:review])
    @review.rating = params[:rating]
    @restaurant = Restaurant.find(params[:review][:restaurant_id])

    if @review.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end
  
  def show
    @review = Review.find(params[:id])
    @restaurant = Restaurant.find(@review.restaurant_id)
  end
end

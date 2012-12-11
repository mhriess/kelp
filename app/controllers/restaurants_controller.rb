class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
  end
  
  def new
    @restaurant = Restaurant.new
  end
  
  def create
    @restaurant = Restaurant.new(params[:restaurant])
    
    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end
end

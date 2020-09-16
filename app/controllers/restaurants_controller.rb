class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # GET http://localhost:3000/restaurants
  def index
    @restaurants = Restaurant.all
  end

  # GET http://localhost:3000/restaurants/1
  def show
    # @restaurant = Restaurant.find(params[:id]) # before_action
  end

  # GET http://localhost:3000/restaurants/1
  def new
    @restaurant = Restaurant.new
  end

  # POST http://localhost:3000/restaurants
  def create
    # params[:restaurant] => {"name"=>"teste", "address"=>"endereço", "rating"=>"10"}

    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save

    redirect_to restaurant_path(@restaurant)

  end

  # GET http://localhost:3000/restaurants/3/edit
  def edit
    # @restaurant = Restaurant.find(params[:id]) # before_action
  end

  # PATCH http://localhost:3000/restaurants/3
  def update
    # @restaurant = Restaurant.find(params[:id]) # before_action
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  # DELETE http://localhost:3000/restaurants/3
  def destroy
    # @restaurant = Restaurant.find(params[:id]) # before_action
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end

end

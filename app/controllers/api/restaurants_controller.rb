class Api::RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    render 'index.json.jbuilder'
  end

  def create
    @restaurant = Restaurant.new(
                                  name: params[:name],
                                  location: params[:location],
                                  blog: params[:blog],
                                  city_id: params[:city_id]
                                )
    if @restaurant.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @restaurant.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    @restaurant.name = params[:name] || @restaurant.name
    @restaurant.location = params[:location] || @restaurant.location
    @restaurant.blog = params[:blog] || @restaurant.blog
    @restaurant.city_id = params[:city_id] || @restaurant.city_id

    if @restaurant.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @restaurant.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant.delete

    render json: {messages: "Successfully deleted Restaurant"}
  end
end

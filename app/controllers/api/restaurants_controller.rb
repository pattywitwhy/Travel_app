class Api::RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    render 'index.json.jbuilder'
  end

  def create
    @restaurant = Restaurant.new(
                                  name: params[:name],
                                  location: params[:location],
                                  blog: params[:blog]
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

    if @restaurant.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @restaurant.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant.delete

    render {messages: "Successfully deleted Restaurant"}
  end
end

class Api::ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
    render 'index.json.jbuilder'
  end

  def create
    @activity = Activity.new(
                                  name: params[:name],
                                  location: params[:location],
                                  blog: params[:blog],
                                  city_id: params[:city_id]
                                )
    if @activity.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @activity.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @activity = Activity.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @activity = Activity.find(params[:id])

    @activity.name = params[:name] || @activity.name
    @activity.location = params[:location] || @activity.location
    @activity.blog = params[:blog] || @activity.blog
    @activity.city_id = params[:city_id] || @activity.city_id

    if @activity.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @activity.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    activity = Activity.find(params[:id])
    activity.delete

    render json: {messages: "Successfully deleted Activity"}
  end
end

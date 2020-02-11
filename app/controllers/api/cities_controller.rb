rclass Api::CitiesController < ApplicationController
  def index
    @cities = City.all
    render 'index.json.jbuilder'
  end

  def create
    @city = City.new(
                      name: params[:name],
                      country: params[:country],
                      post_id: params[:post_id]
                    )
    if @city.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @city.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @city = City.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @city = City.find(params[:id])

    @city.name = params[:name] || @city.name
    @city.country = params[:country] || @city.country
    @city.post_id = params[:post_id] || @city.post_id

    if @city.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @city.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    city = City.find(params[:id])
    city.destroy

    render json: {messages: "Successfully deleted city"}
  end
end

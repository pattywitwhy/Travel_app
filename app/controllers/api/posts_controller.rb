class Api::PostsController < ApplicationController
  def index
    @posts = Post.all
    render 'index.json.jbuilder'
  end

  def show
    @post = Post.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @post = Post.new(
                      blog: params[:blog]
                    )
    if @post.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @post.errors.full_messages}, statut: :unprocessable_entity
    end
  end
end

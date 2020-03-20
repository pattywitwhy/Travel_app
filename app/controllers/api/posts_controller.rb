class Api::PostsController < ApplicationController
  def index
    @posts = Post.all
    # render 'index.json.jbuilder'
    render 'index.html.erb'
  end

  def show
    @post = Post.find(params[:id])
    render 'show.html.erb'
    # render 'show.json.jbuilder'
  end

  def create
    @post = Post.new(
                      title: params[:title],
                      blog: params[:blog],
                      user_id: params[:user_id]
                    )
    if @post.save
      render 'show.json.jbuilder'
      # render 'show.html.erb'

    else
      render json: {errors: @post.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params[:id])

    @post.title = params[:title] || @post.title
    @post.blog = params[:blog] || @post.blog
    @post.user_id = params[:user_id] || @post.user_id

    if @post.save
      # render 'show.json.jbuilder'
      render 'show.html.erb'

    else
      render json: {errors: @post.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.delete

    render json: {messages: "Successfully delete the blog for this post"}
  end
end

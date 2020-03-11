class Api::CommentsController < ApplicationController
  def index
    @comments = Comment.all
    render 'index.json.jbuilder'
  end

  def create
    @comment = Comment.new(
                          post_id: params[:post_id],
                          body: params[:body],
                          user_id: params[user_id]
                          )
    if @comment.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @comment.errors.full_messages} status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @comment = Comment.find(params[:id])

    @comment.post_id = params[:post_id] || @comment.post_id
    @comment.body = params[:body] || @comment.body
    @comment.user_id = params[:user_id] || @comment.user_id

    if @comment.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @comment.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    
    render json: {message: "Successfully deleted comment"}
  end
end
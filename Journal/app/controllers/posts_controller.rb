class PostsController < ApplicationController
  def index
    @posts = Post.all
    render "index"
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render :json
    else
      render json: @post.errors.full_messages, status: 422
    end
  end

  def show
    @post = Post.find(params[:id])
    render 'show'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render 'index'
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

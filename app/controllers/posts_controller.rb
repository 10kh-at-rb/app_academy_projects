class PostsController < ApplicationController
  before_action :redirect_nonauthor, only: [:update, :edit]

  def new
    @post = Post.new(sub_id: params[:sub_id])
    render :new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to sub_url(@post.sub_id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to sub_url(@post.sub_id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  private
  def post_params
    params.require(:post).permit(:sub_id, :title, :url, :content, :author_id)
  end


end

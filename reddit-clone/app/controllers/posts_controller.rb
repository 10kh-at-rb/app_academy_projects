class PostsController < ApplicationController
  before_action :redirect_nonauthor, only: [:update, :edit]

  def new
    @post = Post.new
    @subs = Sub.all
    render :new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def edit
    @post = Post.find(params[:id])
    @subs = Sub.all
    render :edit
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:author)
    render :show
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, :author_id, sub_ids: [])
  end


end

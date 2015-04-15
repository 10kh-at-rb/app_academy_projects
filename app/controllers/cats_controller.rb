class CatsController < ApplicationController
  before_action :verify_ownership, only: [:edit, :update]

  def show
    @requests = current_cat.cat_rental_requests
  end

  def index
    @cats = Cat.all
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = current_user.cats.create!(cat_params)
    redirect_to cat_url(@cat)
  end

  def edit
    current_cat
  end

  def update
    current_cat.update!(cat_params)
    redirect_to cat_url(current_cat)
  end

  def current_cat
    @cat ||= Cat.find(params[:id])
  end


private
  def cat_params
    params.require(:cat).permit(:name, :color, :description, :sex, :birth_date)
  end

  def verify_ownership
    unless current_user == current_cat.owner
      flash[:errors] = "Not your cat, buddy"
      redirect_to cats_url
    end
  end

end

class CatsController < ApplicationController

  def show
    @cat = Cat.find(params[:id])
  end

  def index
    @cats = Cat.all
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.create!(cat_params)
    redirect_to cat_url(@cat)
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update!(cat_params)
    redirect_to cat_url(@cat)
  end


private
  def cat_params
    params.require(:cat).permit(:name, :color, :description, :sex, :birth_date)
  end

end

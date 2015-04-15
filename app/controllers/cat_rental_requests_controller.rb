class CatRentalRequestsController < ApplicationController

  def new
    @cats = Cat.all
    @request = CatRentalRequest.new
  end

  def create
    CatRentalRequest.create!(request_params)
    @cat = Cat.find(request_params[:cat_id])
    redirect_to cat_url(@cat)
  end

  def approve
    @request = CatRentalRequest.find(params[:id])
    @request.approve!
    redirect_to cat_url(@request.current_cat)
  end

  def deny
    @request = CatRentalRequest.find(params[:id])
    @request.deny!
    redirect_to cat_url(@request.current_cat)
  end

  private
  def request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end

end

class CatRentalRequestsController < ApplicationController
  before_action :verify_cat_ownership, only: [:approve, :deny]

  def new
    @cats = Cat.all
    @request = CatRentalRequest.new
  end

  def create
    current_user.cat_rental_requests
    .create!(request_params)
    @cat = Cat.find(request_params[:cat_id])
    redirect_to cat_url(@cat)
  end

  def approve
    current_request.approve!
    redirect_to cat_url(current_request.cat)
  end

  def deny
    current_request.deny!
    redirect_to cat_url(current_request.cat)
  end

  private
  def request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end

  def current_request
    @request ||= CatRentalRequest.find(params[:id])
  end

  def verify_cat_ownership
    unless current_request.cat.owner == current_user
      flash[:errors] = ["You do not own this cat."]
      redirect_to cat_url(current_request.cat)
    end
  end

end

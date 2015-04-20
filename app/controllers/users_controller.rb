class UsersController < ApplicationController

  def new
    @user = User.new
    render :new, layout: 'sign_up'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login! @user
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new, layout: 'sign_up'
    end
  end

  def show
    @user = User.find(params[:id])
    @goal = Goal.new

    @complete_goals = @user.complete_goals
    @incomplete_goals = @user.incomplete_goals
  end

  def index
  end

end

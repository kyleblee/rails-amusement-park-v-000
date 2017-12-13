class UsersController < ApplicationController
  before_action :set_user, only: [:show, :ride]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    redirect_to root_url if !logged_in?
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end

  def set_user
    @user = current_user
  end
end

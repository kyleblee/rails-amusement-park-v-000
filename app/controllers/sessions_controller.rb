class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(name: sign_in_params[:name])
    if @user.authenticate(sign_in_params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome back to the theme park!"
      redirect_to @user
    else
      redirect_to new_user_url
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_url
  end

  private

  def sign_in_params
    params.require(:user).permit(:name, :password)
  end
end

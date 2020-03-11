class UsersController < ApplicationController
  include SessionsHelper

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcom to the Sample App!"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(
      :name, :email, :password,
      :password_confitmation
    )
  end
end

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.new(post_params)
    @user.save
    redirect_to action: 'index'
  end

private
  def post_params
    params.require(:user).permit(:full_name, :phone_number, :email)
  end

end

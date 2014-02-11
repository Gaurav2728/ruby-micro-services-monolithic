class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    begin
      user = User.new(user_params)
      user.save!
      flash[:notice] = "Successfully created user with name #{user.full_name}"
    rescue ActiveRecord::RecordInvalid => e
      flash[:notice] = "Error creating user: #{e.message}"
    end
    redirect_to action: 'index'
  end

  def update
    begin
      user = User.find(params[:id])
      user.update! user_params
      flash[:notice] = "Successfully edited user with name #{user.full_name}"
    rescue ActiveRecord::RecordInvalid => e
      flash[:notice] = "Error editing user: #{e.message}"
    end
    redirect_to action: 'edit'
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:notice] = "Successfully deleted user with name #{user.full_name}"
    redirect_to action: 'index'
  end

private
  def user_params
    params.require(:user).permit(:full_name, :phone_number, :email)
  end

end

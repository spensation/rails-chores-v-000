class UsersController < ApplicationController
  def new
    @user = User.new
    @user.build_house
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user

      redirect_to user_path(@user)
    else
      flash[:notice] = "Sign up failed."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to user_path(@user)
  end

  private

    def user_params
      params.require(:user).permit(:username, :admin, :email, :password, :house_id, :house_attributes => [:name, :city])
    end
end

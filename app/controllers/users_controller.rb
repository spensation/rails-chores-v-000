class UsersController < ApplicationController
  include ApplicationHelper

  def index
    if logged_in?
      @users = User.all
    else
      redirect_to '/login'
    end
  end

  def new
    @user = User.new
    @user.build_house
  end

  def create
   @user = User.new(user_params)
   if @user.save
     session[:user_id] = @user.id
     redirect_to user_chores_path
   else
     render :new
   end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :house_id, :house_attributes => [:name, :city])
    end

end

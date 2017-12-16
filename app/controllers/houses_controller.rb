class HousesController < ApplicationController
  include ApplicationHelper
  before_action :authorize

  def new

  end

  def index
    @houses = House.all
    @user = current_user
  end

  def show
    @house = House.find(params[:id])
    @house_chore = HouseChore.new
    @house_chores = HouseChore.all

    respond_to do |f|      
      f.json {render :json => @house}
      f.html
    end
  end


end

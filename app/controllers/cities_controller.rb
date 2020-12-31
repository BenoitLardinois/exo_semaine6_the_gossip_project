class CitiesController < ApplicationController

  def index    
  end
  
  def show
    @user_city = City.all.find(params[:id])
  end
  
  def new
  end
  
  def create
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
end
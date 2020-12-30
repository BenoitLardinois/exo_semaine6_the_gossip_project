class UsersController < ApplicationController
  def index
    @gossips = User.all
    
  end
  
  def show
    @gossip = User.all.find(params[:id])
  end
  
  def new
    @user = User.new
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
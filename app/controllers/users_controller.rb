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
    new_user = User.new
    new_user.id = User.all.length + 1
    new_user.first_name = params[:user_first_name]
    new_user.first_name = params[:user_last_name]
    new_user.email = params[:user_email]
    new_user.description = params[:user_description]
    new_user.city = params[:user_city]
    new_user.password_confirmation = params[:user_password_confirmation]
    
    if new_user.save
      redirect_to users_path
    else 
      render "/users/new"
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
end
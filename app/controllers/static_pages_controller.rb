class StaticPagesController < ApplicationController
  
  def contact
    
  end
  
  def team
    
  end
  
  def show
    @user_name = params[:user_name]
  end
  
  def profile
  end
  
end
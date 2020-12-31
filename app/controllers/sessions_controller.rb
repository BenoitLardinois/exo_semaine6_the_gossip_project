class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:user_email])
    
    if user && user.authenticate(params[:user_password])
      session[:user_id] = user.id
      redirect_to gossips_path
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to '/sessions/new'
  end
  
end

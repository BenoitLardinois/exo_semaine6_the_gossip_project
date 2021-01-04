class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:user_email])
    
    if user && user.authenticate(params[:user_password])
      #session[:user_id] = user.id
      login(user)
      flash[:notice] = "Bienvenue #{user.first_name} #{user.last_name}"
      remember(user)
      redirect_to gossips_path
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end
  
  def destroy
    #session.delete(:user_id)
    log_out(current_user)
    flash[:notice] = "Tu es désormais déconnecté!"
    redirect_to '/sessions/new'
  end
  
end

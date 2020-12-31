class GossipsController < ApplicationController
  before_action :authenticate_user, except: [:index]
  
  def index
    
    @gossips = Gossip.all
  end
  
  def show
    @gossip = Gossip.find(params[:id])
  end
  
  def edit
    @gossip = Gossip.find(params[:id])
  end
  
  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:title, :content)
    @gossip.update(gossip_params)
    redirect_to gossip_path
  end
  
  def new
    @gossip = Gossip.new
  end
  
  def create
    new_gossip = Gossip.new
    new_gossip.id = Gossip.all.length + 1
    new_gossip.title = params[:gossip_title]
    new_gossip.content = params[:gossip_content]
    new_gossip.user_id = session[:user_id]
    
    if new_gossip.save
      redirect_to gossips_path
    else 
      render "/gossips/new"
    end
    
    #gossip = Gossip.create(the_gossip_params)
    #redirect_to gossip_path(gossip.id)
  end
  

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end
  
  private
  
  def the_gossip_params
    params.require(:gossip).permit(:title, :content, :user_id, :id)
  end
  
end
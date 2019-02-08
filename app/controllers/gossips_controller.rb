class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:create, :new, :show]

  def show
    @gossips = Gossip.find(params[:id])
  end

   def new
    @gossip = Gossip.new
   end

   def create
    @gossip = Gossip.new(content: params[:content], title: params[:title])
    @gossip.user = current_user
    # @gossip.user = User.find_by(id: session[:user_id])
    if @gossip.save
        flash[:notice] = "Post successfully created by #{current_user.first_name}"
        flash[:type] = "info"
        redirect_to root_path
      else
        render 'new'
      end
   end

   def index
    @gossips = Gossip.all
  end

  def edit
    @gossip = Gossip.find(params[:id])
    if current_user.id == @gossip.user.id
    else
      flash[:notice] = "You're not the author of this gossip"
      flash[:type] = "danger"
      redirect_to root_path
    end

  end
  
  def update
    @gossip = Gossip.find(params[:id])
    if current_user.id == @gossip.user.id
      gossip_params = params.require(:gossip).permit(:title, :content)
      if @gossip.update(gossip_params)
        flash[:notice] = "Post successfully modified"
        flash[:type] = "info"
        redirect_to root_path
      else
        render :edit
      end
    else
      flash[:notice] = "You're not the author of this gossip"
      flash[:type] = "danger"
      redirect_to root_path
    end
  end
  
  def destroy
    @gossip = Gossip.find(params[:id])
    if current_user.id == @gossip.user.id
      @gossip.destroy
      flash[:notice] = "Post successfully deleted"
      flash[:type] = "danger"
      redirect_to root_path
    else
      flash[:notice] = "You're not the author of this gossip"
      flash[:type] = "danger"
      redirect_to root_path
    end
  end

  private
  
  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in to perform this action"
      redirect_to new_session_path
    end
  end

end

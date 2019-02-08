class LikesController < ApplicationController
  before_action :authenticate_user, only: [:create, :destroy]

  def create
    if already_liked?
      puts already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @like = Like.new(user_id: current_user.id, likeable_type: "Gossip", likeable_id: params[:gossip_id] )
      @like.save
    end
    Rails.application.routes.recognize_path('/gossips') ? (redirect_back fallback_location: root_path) : (redirect_to root_path)
  end
  
  def destroy
    find_like
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    Rails.application.routes.recognize_path('/gossips') ? (redirect_back fallback_location: root_path) : (redirect_to root_path)
    #   redirect_to gossip_path(@gossip)
  end
  
  private
  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in to Like"
      redirect_to new_session_path
    end
  end

  def already_liked?
    Like.where(user_id: current_user.id, likeable_id:
    params[:gossip_id]).exists?
  end

  def find_like
    @gossip = Gossip.find(params[:gossip_id])
    @like = @gossip.likes.find { |like| like.user_id == current_user.id}
  end

end

class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]

  def new
    @comment = Comment.new
  end

  def create
    puts params
    @comment = Comment.new(content: params[:content], user_id: User.last.id, commenteable_type: "Gossip", commenteable_id: params[:gossip_id] )
      if @comment.save
        flash[:notice] = "Comment successfully created"
        flash[:info] = "danger"
        redirect_to gossip_path(params[:gossip_id])
      else
        render 'new'
      end
  end

  def edit
    @comment = Comment.find(params[:id])
    @gossip = params[:gossip_id]
  end
  
  def update
    @comment = Comment.find(params[:id])
    # puts params[:gossip]
    # comment_params = params.require(:comment).permit(:content)
    # comment_params = params[:content]
    puts "*" *70
    if @comment.update(content: params[:content], user_id: "11", commenteable_id: params[:gossip_id], commenteable_type: "Gossip")
      flash[:notice] = "Comment successfully modified"
      flash[:type] = "info"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in to comment"
      redirect_to new_session_path
    end
  end

end

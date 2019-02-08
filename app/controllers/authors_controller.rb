class AuthorsController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end


  def create
    puts params
    @user = User.new(email: params[:email], password: params[:password], city_id: City.all.ids.sample, first_name: params[:first_name], last_name: params[:last_name])
      if @user.save
        flash[:notice] = "User successfully created"
        flash[:type] = "info"
        session[:user_id] = @user.id
        redirect_to root_path
      else
        render 'new'
      end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :email, :age, :password)
  end


end

class SessionsController < ApplicationController
  def new
  end

  def create
    puts params[:session]
    puts "*" * 40
    # session.each do |el|
    #   puts el
    # end
    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:email])
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # params[:remember_me] == '1' ? remember(user) : forget(user)
      params[session: :remember_me] == '1' ? remember(user) : forget(user)
      # remember user
      flash[:notice] = "You are logged in"
      flash[:type] = "info"
      redirect_to root_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    # log_out if logged_in?
    session.delete(:user_id)
    flash[:notice] = "You've been deconnected. bim!"
      flash[:type] = "info"
    redirect_to root_path
  end
end

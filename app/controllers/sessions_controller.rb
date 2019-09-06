class SessionsController < ApplicationController

  def new
  end

  def create
    if auth
      # Logged in via oauth
      user = User.find_or_create_by_omniauth(auth)
      session[:user_id] = user.id
      redirect_to root_path
    else
      # Normal login flow
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path
      else
        render 'sessions/new'
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
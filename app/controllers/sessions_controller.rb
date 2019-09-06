class SessionsController < ApplicationController

  def new
  end

  def create
    if auth
      # Logged in via oauth
      raise auth.inspect
      #name: Andrew Davisson
      #email: akdavisson4@gmail.com
      user = User.find_or_create_by(uid: auth[:uid]) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
      end
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
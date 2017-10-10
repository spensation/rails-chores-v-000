class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      oauth_email = request.env["omniauth.auth"]["info"]["email"]
      if user = User.find_by(:email => oauth_email)

        session[:user_id] = user.id
      else

        user = User.new(:email => oauth_email, :password => SecureRandom.hex)

        if user.save
          session[:user_id] = user.id

          redirect_to root_path
        else
          raise user.errors.full_messages.inspect
        end
      end
    else @user = User.find_by(:email => params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path
      else
        render :'sessions/new'
      end
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end

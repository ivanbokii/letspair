class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = login(params[:username_or_email], params[:password], params[:remember_me])
    if @user
      redirect_to :root
    else
      flash.notice = 'wrong username/email or password'
      redirect_to new_session_url
    end
  end

  def destroy
    logout
    redirect_to :root
  end
end

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = login(params[:username_or_email], params[:password])

    redirect_to :root
  end

  def destroy
    logout
    redirect_to :root
  end
end

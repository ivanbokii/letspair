class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @show_edit = (current_user and @user.id == current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    user.save();

    redirect_to :root
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    User.update(params[:id], params[:user])

    redirect_to user_url
  end
end
class UsersController < ApplicationController
  def index
    # @users = User.all
  end

  def get_users
    results = User.all
    render json: results.to_json
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

    if user.save
      auto_login(user, false)
      redirect_to :root
    else
      flash.notice = user.errors.messages
      redirect_to :root
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    current_user.update_attributes(params[:user])

    redirect_to user_url
  end
end

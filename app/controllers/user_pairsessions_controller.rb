class UserPairsessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create
  skip_before_filter :verify_authenticity_token, only: :destroy
  skip_before_filter :verify_authenticity_token, only: :update

  def index
  end

  def create
    params[:user_pairsession][:user_id] = current_user.id
    pairsession = Hash[params[:user_pairsession].map { |key, value| [key.underscore, value] }]

    pairsession = Pairsession.create(pairsession)
    #ivanbokii check for errors after create and show error if something
    #went wrong

    render status: 200, json: pairsession
  end

  def destroy
    pairsession = current_user.pairsessions.find(params[:id])
    pairsession.destroy

    render status: 200, json: @controller.to_json
  end

  def update
    #ivanbokii check for errors after create and show error if something
    #went wrong
    params[:user_pairsession][:user_id] = current_user.id
    pairsession = Hash[params[:user_pairsession].map { |key, value| [key.underscore, value] }]

    clean_out_params pairsession
    savedPairsession = current_user.pairsessions.find(params[:id])
    savedPairsession.update_attributes(pairsession)

    render status: 200, json: @controller.to_json
  end

  def fordate
    user = User.find(params[:user_id])
    pairsessions = user.pairsessions.get_for_date params[:date]

    render json: pairsessions.to_json
  end

  def markers
    user = User.find(params[:user_id])
    dates = user.pairsessions.get_sessions_dates

    render json: dates.to_json
  end

  private
  def clean_out_params(pairsession)
    pairsession.delete 'created_at'
    pairsession.delete 'updated_at'
    pairsession.delete 'start'
    pairsession.delete 'end'
    pairsession.delete 'id'
    pairsession.delete 'username'
    pairsession.delete 'timezone'
    pairsession.delete 'userprofile_url'
    pairsession.delete 'user_avatar'
  end
end

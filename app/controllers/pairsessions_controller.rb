class PairsessionsController < ApplicationController
  def index
  end

  def show
    pairsession = Pairsession.find(params[:id])
    result = pairsession.attributes
    result[:user_avatar] = pairsession.user.image_url
    result[:username] = pairsession.user.username

    render json: result.to_json
  end

  def markers
    dates = Pairsession.get_sessions_dates

    render json: dates.to_json
  end

  def fordate
    pairsessions = Pairsession.get_for_date params[:date]
    results = pairsessions.map do |p|
      p[:userprofile_url] = user_url(p[:username])

      #need to add path to user avatar to use it in template
      user = User.find(p['user_id'])
      p[:user_avatar] = user.image_url
      p
    end

    render json: results.to_json
  end
end

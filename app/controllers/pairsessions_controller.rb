class PairsessionsController < ApplicationController
  def index
  end

  def markers
    dates = Pairsession.get_sessions_dates

    render json: dates.to_json
  end

  def fordate
    pairsessions = Pairsession.get_for_date params[:date]
    results = pairsessions.map do |p|
      p[:userprofile_url] = user_url(p[:username])
      p
    end

    render json: results.to_json
  end
end

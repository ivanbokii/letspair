class PairsessionsController < ApplicationController
  def index
  end

  def markers
    dates = Pairsession.get_sessions_dates

    render json: dates.to_json
  end

  def fordate
    pairsessions = Pairsession.get_for_date params[:date]

    render json: pairsessions.to_json
  end
end

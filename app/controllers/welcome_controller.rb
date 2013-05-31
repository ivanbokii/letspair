class WelcomeController < ApplicationController
  def index
    @show_logo = true;

    #ivanbokii todo | this code should go to a separate service
    top_pairsessions = Pairsession.get_last(5)
    top_users = User.get_last(5)

    united_entities = top_pairsessions.concat top_users
    @result = united_entities.sort { |a, b| b.created_at <=> a.created_at }
  end
end

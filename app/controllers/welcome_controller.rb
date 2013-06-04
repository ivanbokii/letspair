class WelcomeController < ApplicationController
  def index
    @show_logo = true;

    #ivanbokii todo | this code should go to a separate service
    top_pairsessions = Pairsession.get_last(5).map do |tp|
      result = tp.attributes
      result[:userprofile_url] = user_url(tp.user.username)
      result[:username] = tp.user.username
      result[:user_avatar] = tp.user.image_url
      result
    end


    top_users = User.get_last(5).map do |tu|
      result = tu.attributes
      result[:userprofile_url] = user_url(tu.username)
      result[:user_avatar] = tu.image_url
      result
    end

    gon.events = top_pairsessions.concat top_users
  end
end

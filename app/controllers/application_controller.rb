class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_gon

  def set_gon
    gon.savePairsessionURL = user_pairsessions_url(current_user.username)
    gon.pairsessionTemplateURL = ActionController::Base.helpers.asset_path('pairsession_view.html')
    gon.pairsessionContactTemplateURL = ActionController::Base.helpers.asset_path('pairsession_contact.html')
    gon.getSessionsForDate = url_for(controller: 'pairsessions', action: 'fordate', date: '')
    gon.deletePairsessionURL = url_for(controller: 'user_pairsessions', action: 'destroy', user_id: "#{current_user.id}", id: '')
    gon.updatePairsessionURL = url_for(controller: 'user_pairsessions', action: 'update', user_id: "#{current_user.id}", id: '')
    gon.allMarkers = markers_pairsessions_url
  end
end

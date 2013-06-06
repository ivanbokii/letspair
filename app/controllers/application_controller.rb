class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_gon

  def set_gon
    gon.pairsessionTemplateURL = ActionController::Base.helpers.asset_path('pairsession_edit.erb')
    gon.pairsessionContactTemplateURL = ActionController::Base.helpers.asset_path('pairsession_all.erb')
    gon.pairsessionUserTemplateURL = ActionController::Base.helpers.asset_path('pairsession_user.erb')
    gon.contactButtonAssetURL = ActionController::Base.helpers.asset_path('button_contact.png')
    gon.contactWindowTemplateURL = ActionController::Base.helpers.asset_path('contact_window.erb')
    gon.lasteventUrl = ActionController::Base.helpers.asset_path('last_event.erb')
    
    gon.getSessionByID = url_for(controller: 'pairsessions', action: 'show', id: '')
    gon.pairsession_contact = url_for(controller: 'pairsessions', action: 'contact', pairsession_id: '_pairsession_id_')
    gon.allMarkers = markers_pairsessions_url
    gon.allMarkersForUser = url_for(controller: 'user_pairsessions', action: 'markers', user_id: '_user_id_')
    gon.getSessionsForDate = url_for(controller: 'pairsessions', action: 'fordate', date: '')
    gon.getSessionsForUserAndDate = url_for(controller: 'user_pairsessions', action: 'fordate', date: '', user_id: '_user_id_')

    if current_user
      gon.savePairsessionURL = user_pairsessions_url(current_user.username)
      gon.deletePairsessionURL = url_for(controller: 'user_pairsessions', action: 'destroy', user_id: "#{current_user.id}", id: '')
      gon.updatePairsessionURL = url_for(controller: 'user_pairsessions', action: 'update', user_id: "#{current_user.id}", id: '')
    end
  end
end

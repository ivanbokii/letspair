window.letspair.application.factory 'serverPairsessions', 
['$http', '$q', 
($http, $q) ->
  save = (session) ->
    deferred = $q.defer()

    $http(
      method: 'POST'
      url: gon.savePairsessionURL
      data: {user_pairsession: session}
    ).
    success( (data) ->
      deferred.resolve data
    ).
    error( (data, status) -> 
      deferred.reject status
    )

    return deferred.promise

  destroy = (session) ->
    deferred = $q.defer()

    $http(
      method: 'DELETE'
      url: gon.deletePairsessionURL + "/#{session.id}"
    ).
    success( (data) ->
      deferred.resolve data
    ).
    error( (data, status) -> 
      deferred.reject status
    )

    return deferred.promise

  getFor = (date) ->
    deferred = $q.defer()
    urlDate = date.format('YYYY-MM-DD')

    $http(
      method: 'GET'
      url: gon.getSessionsForDate + "#{urlDate}"
    ).
    success( (data) ->
      deferred.resolve data
    ).
    error( (data, status) -> 
      deferred.reject status
    )

    return deferred.promise

  getEventsForUser = (userId, date) ->
    deferred = $q.defer()
    urlDate = date.format('YYYY-MM-DD')

    $http(
      method: 'GET'
      url: gon.getSessionsForUserAndDate.replace('_user_id_', userId) + "#{urlDate}"
    ).
    success( (data) ->
      deferred.resolve data
    ).
    error( (data, status) -> 
      deferred.reject status
    )

    return deferred.promise

  update = (session) ->
    deferred = $q.defer()

    $http(
      method: 'PUT'
      url: gon.updatePairsessionURL + "#{session.id}"
      data: {user_pairsession: session}
    ).
    success( (data) ->
      deferred.resolve data
    ).
    error( (data, status) -> 
      deferred.reject status
    )

    return deferred.promise

  getMarkers = ->
    deferred = $q.defer()

    $http(
      method: 'GET'
      url: gon.allMarkers
    ).
    success( (data) ->
      deferred.resolve data
    ).
    error( (data, status) -> 
      deferred.reject status
    )

    return deferred.promise

  getMarkersForUser = (userId) ->
    deferred = $q.defer()

    $http(
      method: 'GET'
      url: gon.allMarkersForUser.replace('_user_id_', userId)
    ).
    success( (data) ->
      deferred.resolve data
    ).
    error( (data, status) -> 
      deferred.reject status
    )

    return deferred.promise

  getById = (id) ->
    deferred = $q.defer()

    $http(
      method: 'GET'
      url: gon.getSessionByID + "#{id}"
    ).
    success( (data) ->
      deferred.resolve data
    ).
    error( (data, status) -> 
      deferred.reject status
    )

    return deferred.promise

  sendContactMessage = (data) ->
    deferred = $q.defer()

    $http(
      method: 'POST'
      url: gon.pairsession_contact.replace('_pairsession_id_', data.pairsession_id)
      data: {contact_information: data}
    ).
    success( (data) ->
      deferred.resolve data
    ).
    error( (data, status) -> 
      deferred.reject status
    )

    return deferred.promise


  return {
    save: save
    destroy: destroy
    getFor: getFor
    update: update
    getMarkers: getMarkers
    getMarkersForUser: getMarkersForUser
    getEventsForUser: getEventsForUser
    getById: getById
    sendContactMessage: sendContactMessage
  }
]
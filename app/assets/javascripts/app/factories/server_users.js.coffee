window.letspair.application.factory 'serverUsers',
['$http', '$q', ($http, $q) ->

  getFor = (currentSort) ->
    deferred = $q.defer()

    $http(
      method: 'GET'
      url: '/get_users'
    ).
    success( (data) ->
      deferred.resolve data
    ).
    error( (data, status) ->
      deferred.reject status
    )

    return deferred.promise

  return {
    getFor: getFor
  }
]

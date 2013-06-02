window.letspair.application.factory 'serverTemplates', ($http, $q) ->
  getContactTemplate = ->
    deferred = $q.defer()

    $http(
      method: 'GET'
      url: gon.contactWindowTemplateURL
    ).
    success( (data) ->
      deferred.resolve data
    ).
    error( (data, status) -> 
      deferred.reject status
    )

  {  
    getContactTemplate: getContactTemplate
  }
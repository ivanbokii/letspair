window.letspair.application.directive 'openscontactform',
($http, $compile, serverTemplates, serverPairsessions, $q, modalWindow) ->
  restrict: 'A'

  controller: ($scope) ->
    showModalWindow = (template, pairsession) ->
      $scope.pairsession = pairsession
      result = $compile(template)($scope)
      $("#contact-form").html(result)
      modalWindow.open()

    this.open = (sessionId) ->
      #this is not optimal. Need to precompile templates
      $q.all([
        serverTemplates.getContactTemplate(),
        serverPairsessions.getById(sessionId)
      ]).
      then (results) ->
        template = results[0].data
        pairsession = results[1]

        showModalWindow(template, pairsession)
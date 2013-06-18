window.letspair.application.directive 'openscontactform',
['$http', '$compile', 'serverTemplates', 'serverPairsessions', '$q', 'modalWindow', 'timeHelper',
($http, $compile, serverTemplates, serverPairsessions, $q, modalWindow, timeHelper) ->
  restrict: 'A'

  controller: ['$scope', ($scope) ->
    $scope.contactMessage = {}
    $scope.closeButton = gon.closeButtonAssetURL

    showModalWindow = (template, pairsession) ->
      $scope.pairsession = pairsession
      result = $compile(template)($scope)
      $("#contact-form").html(result)
      modalWindow.open()

    this.open = (sessionId) ->
      # this is not optimal. Need to precompile templates
      $q.all([
        serverTemplates.getContactTemplate(),
        serverPairsessions.getById(sessionId)
      ]).
      then (results) ->
        template = results[0].data
        pairsession = results[1]

        startTime = timeHelper.getDate(new Date(pairsession.start_time).getTime())
        endTime = timeHelper.getDate (new Date(pairsession.end_time).getTime())

        pairsession.start = timeHelper.getShortTime startTime
        pairsession.end = timeHelper.getShortTime endTime

        showModalWindow(template, pairsession)

    $scope.sendContactMessage = (event) ->
      #todo not conventional for angular.js

      validationResult = $('form.message').validationEngine('validate')
      return unless validationResult


      contactMessage = 
        pairsession_id: $scope.pairsession.id
        email: $scope.contactMessage.email
        message: $scope.contactMessage.message

      result = serverPairsessions.sendContactMessage(contactMessage)

      #clearing out
      $scope.contactMessage = {}

      #I know this is not good and we need to receive server response
      #to notify user about success or any errors, but I'm going to
      #remove email usage for communication and move to site messages
      $.modal.close()
      event.preventDefault()
    ]
]
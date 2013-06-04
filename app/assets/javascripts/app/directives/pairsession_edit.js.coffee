window.letspair.application.directive 'pairsessionedit', 
(timeHelper) ->
  restrict: "E"
  scope:
    session: '='
    deletesession: '&'
    savechanges: '&'

  templateUrl: gon.pairsessionTemplateURL
  controller: ($scope) ->
    $scope.editMode = false

    $scope.switchToEditMode = (switchValue) ->
      $scope.editMode = switchValue

  link: (scope, element) ->
    scope.update = (session) ->
      scope.switchToEditMode(false)

      session.start = element.find('.start-time').val()
      session.end = element.find('.end-time').val()

      scope.savechanges(session)

    #convert dates to ones with the right time in it (because of browser automatic conversion
    #to user's timezone)
    if scope.session.start == undefined and scope.session.end == undefined
      startTime = timeHelper.getDate(new Date(scope.session.start_time).getTime())
      endTime = timeHelper.getDate (new Date(scope.session.end_time).getTime())

      scope.session.start = timeHelper.getShortTime startTime
      scope.session.end = timeHelper.getShortTime endTime

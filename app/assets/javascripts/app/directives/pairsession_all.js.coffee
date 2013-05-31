window.letspair.application.directive 'pairsessionall', 
(timeHelper) ->
  restrict: "E"
  scope:
    session: '='

  templateUrl: gon.pairsessionContactTemplateURL
  link: (scope, element) ->

    #convert dates to ones with the right time in it (because of browser automatic conversion
    #to user's timezone)
    startTime = timeHelper.getDate(new Date(scope.session.start_time).getTime())
    endTime = timeHelper.getDate (new Date(scope.session.end_time).getTime())

    scope.session.start = timeHelper.getShortTime startTime
    scope.session.end = timeHelper.getShortTime endTime
window.letspair.application.directive 'pairsessionuser', 
(timeHelper) ->
  restrict: "E"
  require: 'openscontactform'
  scope:
    session: '='

  templateUrl: gon.pairsessionUserTemplateURL
  link: (scope, element, attrs, opensContactFormController) ->

    scope.contact = (event) ->
      opensContactFormController.open(scope.session.id)
      event.preventDefault()

    #convert dates to ones with the right time in it (because of browser automatic conversion
    #to user's timezone)
    startTime = timeHelper.getDate(new Date(scope.session.start_time).getTime())
    endTime = timeHelper.getDate (new Date(scope.session.end_time).getTime())

    scope.session.start = timeHelper.getShortTime startTime
    scope.session.end = timeHelper.getShortTime endTime

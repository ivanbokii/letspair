window.letspair.application.directive 'lastevent',
(timeHelper) ->
  restrict: 'E'
  require: 'openscontactform'
  scope:
    event: '='

  templateUrl: gon.lasteventUrl
  link: (scope, element, attrs, opensContactFormController) ->
    scope.isUser = angular.isUndefined(scope.event.user_id)

    unless scope.isUser
      startTime = timeHelper.getDate(new Date(scope.event.start_time).getTime())
      endTime = timeHelper.getDate (new Date(scope.event.end_time).getTime())

      scope.event.start = timeHelper.getShortTime startTime
      scope.event.end = timeHelper.getShortTime endTime

    scope.contact = (event) ->
      opensContactFormController.open(scope.event.id)      
      event.preventDefault()
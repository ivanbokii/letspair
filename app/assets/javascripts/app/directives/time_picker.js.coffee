window.letspair.application.directive 'timepicker',
->
  restrict: 'A'
  scope:
    time: '='

  link: (scope, element) ->
    element.timepicker(timeFormat: 'G:i')
    element.timepicker('setTime', scope.time) unless angular.isUndefined(scope.time)

    element.on('blur', ->
      scope.time = $(this).val()

      unless scope.$$phase then scope.$apply()
    )

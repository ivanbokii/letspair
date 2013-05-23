window.letspair.application.directive 'calendar', 
(DPCalendar) -> 
  restrict: 'E'
  
  scope:
    daychange: '&'
  
  template: '<div id="calendar"></div>'

  link: (scope) ->
    DPCalendar.init(scope.daychange);
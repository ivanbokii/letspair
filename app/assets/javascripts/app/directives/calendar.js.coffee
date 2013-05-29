window.letspair.application.directive 'calendar', 
(DPCalendar, serverPairsessions) -> 
  restrict: 'E'
  
  scope:
    daychange: '&'
  
  template: '<div id="calendar"></div>'

  link: (scope) ->
    result = serverPairsessions.getMarkers()
    result.then(
      (data) ->
        dates = _.map data, (value) -> new Date(value)
        $.fn.dp_calendar.markDates(dates)
      (status) ->
        $log.error "markers can not be fetched #{status}"
    )

    DPCalendar.init(scope.daychange)
    scope.daychange()
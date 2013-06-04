window.letspair.application.directive 'calendar', 
(DPCalendar, serverPairsessions) -> 
  restrict: 'E'
  
  scope:
    daychange: '&'
    userid: '&'
  
  template: '<div id="calendar"></div>'

  link: (scope) ->
    result = null
    #not sure why, but & binding is not accessible here
    if angular.isUndefined scope.userid()
      result = serverPairsessions.getMarkers() 
    else
      result = serverPairsessions.getMarkersForUser(scope.userid()) 

    result = 
    result.then(
      (data) ->
        dates = _.map data, (value) -> new Date(value)
        $.fn.dp_calendar.markDates(dates)
      (status) ->
        $log.error "markers can not be fetched #{status}"
    )

    DPCalendar.init(scope.daychange)
    scope.daychange()
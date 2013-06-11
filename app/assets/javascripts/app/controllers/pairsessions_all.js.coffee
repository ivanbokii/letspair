window.letspair.application.controller 'PairsessionsAllCtrl', 
['$scope', 'DPCalendar', 'serverPairsessions', '$log', 
($scope, DPCalendar, serverPairsessions, $log) ->
  $scope.sessions = []

  $scope.loadDaySessions = ->
    currentDate = DPCalendar.getCurrentDate()
    
    sessions = serverPairsessions.getFor(currentDate)
    sessions.then(
      (data) ->
        $scope.sessions = data
      (status) ->
        $log.error "can not load sessions for #{currentDate} #{status}"
    )
]
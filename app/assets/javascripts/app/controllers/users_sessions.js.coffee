window.letspair.application.controller 'UsersSessionsCtrl', 
($scope, DPCalendar, serverPairsessions) ->
  $scope.sessions = []
  $scope.showAvatar = true

  $scope.loadDaySessions = ->
    currentDate = DPCalendar.getCurrentDate()
    
    sessions = serverPairsessions.getFor(currentDate)
    sessions.then(
      (data) ->
        $scope.sessions = data
      (status) ->
        $log.error "can not load sessions for #{currentDate} #{status}"
    )
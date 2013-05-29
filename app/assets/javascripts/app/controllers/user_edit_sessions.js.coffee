window.letspair.application.controller 'UserEditSessionsCtrl', 
($scope, serverPairsessions, DPCalendar, $log, timeHelper) ->
  $scope.createSessionMode = false
  $scope.newSession = {}
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

  $scope.switchToCreateMode = (switchValue) ->
    $scope.newSession = {}
    $scope.createSessionMode = switchValue

  $scope.saveNewSession = ->
    $scope.newSession.date = DPCalendar.getCurrentDate()
    result = serverPairsessions.save $scope.newSession
    newSession = $scope.newSession

    result.then(
      ->
        newSession.start = timeHelper.getShortTimeFromString newSession.start_time
        newSession.end = timeHelper.getShortTimeFromString newSession.end_time

        $scope.switchToCreateMode false
        $scope.sessions.unshift newSession

        $.fn.dp_calendar.markDate(newSession.date.toDate())
      (status) ->
        $log.error "pairsession was not saved #{status}"
    )

  $scope.deleteSession = (session) ->
    result = serverPairsessions.destroy session
    result.then(
      ->
        index = _.indexOf($scope.sessions, session)
        $scope.sessions.splice(index, 1)
        $.fn.dp_calendar.unmarkDate(moment(session.date, 'YYYY-MM-DD').toDate())
      (status) ->
        $log.error "pairsession was not saved #{status}"
    )

  $scope.saveChanges = (session) ->
    session.start_time = moment(session.start, 'H:mm')
    session.end_time = moment(session.end, 'H:mm')

    result = serverPairsessions.update session

    result.then(
      ->
        session.start = timeHelper.getShortTimeFromString session.start
        session.end = timeHelper.getShortTimeFromString session.end
      (status) ->
        $log.error "pairsession was not saved #{status}"
    )
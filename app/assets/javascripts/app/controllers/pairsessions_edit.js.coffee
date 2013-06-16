window.letspair.application.controller 'PairsessionsEditCtrl', 
['$scope', 'serverPairsessions', 'DPCalendar', '$log', 'timeHelper',
($scope, serverPairsessions, DPCalendar, $log, timeHelper) ->
  $scope.createSessionMode = false
  $scope.newSession = {}
  $scope.sessions = []

  $scope.loadDaySessions = ->
    $scope.switchToCreateMode(false)
    currentDate = DPCalendar.getCurrentDate()
    
    sessions = serverPairsessions.getEventsForUser($scope.userId, currentDate)
    sessions.then(
      (data) ->
        $scope.sessions = data
      (status) ->
        $log.error "can not load sessions for #{currentDate} #{status}"
    )

  $scope.switchToCreateMode = (switchValue) ->
    $scope.newSession = {}
    #this is not conventional and should be refactored
    $('.new-session-form .start-time').val('')
    $('.new-session-form .end-time').val('')

    $scope.createSessionMode = switchValue
    $('.new-session-form').validationEngine('hide') if switchValue

  $scope.saveNewSession = (event) ->
    event.preventDefault()
    
    #this is not conventional for angular.js. should be refactored to the directive
    validationResult = $('.new-session-form').validationEngine('validate')
    return unless validationResult

    $scope.newSession.date = DPCalendar.getCurrentDate()
    result = serverPairsessions.save $scope.newSession
    newSession = $scope.newSession

    result.then(
      (data) ->
        newSession.start = timeHelper.getShortTimeFromString newSession.start_time
        newSession.end = timeHelper.getShortTimeFromString newSession.end_time
        newSession.id = data.id

        $scope.switchToCreateMode false
        $scope.sessions.unshift newSession
        $scope.newSession = {}

        #this is not conventional and should be refactored
        $('.new-session-form .start-time').val('')
        $('.new-session-form .end-time').val('')

        $.fn.dp_calendar.markDate(newSession.date.toDate())
      (status) ->
        $scope.newSession = {}

        #this is not conventional and should be refactored
        $('.new-session-form .start-time').val('')
        $('.new-session-form .end-time').val('')

        $log.error "pairsession was not saved #{status}"
    )

  $scope.deleteSession = (session) ->
    unless confirm("Are you sure you want to delete the pairsession?") then return

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
]
window.letspair.application.controller 'UsersAllCtrl',
['$scope', 'DPCalendar', 'serverUsers', '$log',
($scope, DPCalendar, serverUsers, $log) ->
  $scope.users = []

  $scope.loadUsers = ->
    currentSort = 'whatever'
    users = serverUsers.getFor(currentSort)
    users.then(
      (data) ->
        $scope.users = data
      (status) ->
        $log.error "can not load users for #{currentSort} #{status}"
    )
  $scope.loadUsers()

  $scope.currentPage = 0
  $scope.pageSize = 10
  $scope.data = []
  
  $scope.numPages = ->
    Math.ceil $scope.users.length / $scope.pageSize
]

window.letspair.application.filter "startFrom", ->
  (input, start) ->
    start = +start
    input.slice start
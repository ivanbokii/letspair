window.letspair.application.directive 'userpartial', 
['timeHelper',
(timeHelper) ->
  restrict: "E"
  scope:
    user: '='

  templateUrl: gon.userPartialTemplateURL
  
]
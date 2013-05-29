window.letspair.application.factory 'timeHelper', ->
  getDate = (timestamp) ->
    date = new Date(timestamp)
         
    year    = date.getUTCFullYear()
    month   = date.getUTCMonth() + 1
    day     = date.getUTCDate()
    hours   = date.getUTCHours()
    minutes = date.getUTCMinutes()
    seconds = date.getUTCSeconds()
         
    month = if month < 10 then '0' + month else month
    day = if day < 10 then '0' + day else day
    hours = if hours < 10 then '0' + hours else hours
    minutes = if minutes < 10 then '0' + minutes else minutes
    seconds = if seconds < 10 then '0' + seconds else seconds
         
    new Date(year + '-' + month + '-' + day + ' ' + hours + ':' + minutes)

  getShortTime = (time) ->
    moment(time).format('hh:mma')

  getShortTimeFromString = (time) ->
    arr = time.split(':')
    hours = arr[0]
    minutes = arr[1]

    hoursWithModifier = switch
      when hours <= 12
        if hours == '12' then [hours, 'pm'] else [hours, 'am']
      when hours > 12 then [hours - 12, 'pm']
      else throw new Error('hours value is not correct')

    "#{hoursWithModifier[0]}:#{minutes}#{hoursWithModifier[1]}"

  {
    getDate: getDate
    getShortTime: getShortTime
    getShortTimeFromString: getShortTimeFromString
  }
  

window.letspair.application.factory 'DPCalendar', ->
  init = (changeHandler) ->
    $("#calendar").dp_calendar
      onChangeDay: changeHandler
      onChangeMonth: changeHandler

  markDates = (dates) ->
    $.fn.dp_calendar.markDates(dates);

  getCurrentDate = ->
    return moment($.fn.dp_calendar.getDate());

  {
    init: init
    markDates: markDates
    getCurrentDate: getCurrentDate
  }
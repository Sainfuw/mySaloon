$(document).on('turbolinks:load', function() {  
  /*---timepicker with focusin---*/
  $('#modalInput').on('focusin', '.timePicker', function() {
    $(this).timepicker({
      'disableTimeRanges': [
        ['12am', '6am'],
        ['9:01pm', '11:31pm']
      ]
    });
  });
  /*---end timepicker---*/
  
  /*---Selectable fullcalendar---*/
  var current_date = moment().format("YYYY-MM-DD");
	$('#calendar').fullCalendar({
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
    locale: 'es',
    defaultDate: current_date,
    navLinks: true, // can click day/week names to navigate views
    selectable: true,
    displayEventEnd: true,
    select: function(event) {
      $.ajax({
        url: '/bookings/new',
        type: 'GET',
        dataType: 'script',
        data: {
          date: event.format(),
        }
      })
    },
    eventClick: function (event, jsEvent, view) {
      $.ajax({
        url: '/bookings/' + event.id + '/edit',
        type: 'GET',
        dataType: 'script',
        data: {
          date: event.start.format(),
        }
      })
      if (event.url) { return false }
    },
    eventDrop: function(event, delta, revertFunc) {
      if (confirm("Quiere cambiar el evento " + event.title + " al dia " + event.start.format("DD-MM-YYYY") + "?")) {
        $.ajax({
          url: '/bookings/' + event.id,
          type: 'PATCH',
          dataType: 'script',
          data: {
            booking: { start: event.start.format() },
            authenticity_token: $("#calendar").data("token")
          }
        })
      } else {
        revertFunc();
      }
    },
    editable: true,
    eventLimit: true, // allow "more" link when too many events
    events: '/bookings'
  });
  /*---end Selectable fullcalendar---*/
});
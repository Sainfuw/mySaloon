$(document).on('turbolinks:load', function() {  
  
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
          booking: { date: event.format() },
          authenticity_token: $("#calendar").data("token")
        }
      })
    },
    eventClick: function (event, jsEvent, view) {
      $.ajax({
        url: '/bookings/' + event.id + '/edit',
        type: 'GET',
        dataType: 'script',
        data: {
          booking: { date: event.start.format() },
          authenticity_token: $("#calendar").data("token")
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
            booking: { date: event.start.format() },
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
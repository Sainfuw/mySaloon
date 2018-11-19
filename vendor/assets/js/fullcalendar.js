	
$(document).on('turbolinks:load', function() {
  var current_date = moment().format("YYYY-MM-DD");
  /*---Selectable fullcalendar---*/
	$('#calendar').fullCalendar({
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
    defaultDate: current_date,
    navLinks: true, // can click day/week names to navigate views
    selectable: true,
    displayEventEnd: true,
    select: function() {
      $.ajax({
        url: '/bookings/new',
        type: 'GET',
        dataType: 'script'
      })
    },
    eventClick: function (event, jsEvent, view) {
      $.ajax({
        url: '/bookings/' + event.id + '/edit',
        type: 'GET',
        dataType: 'script'
      })
      if (event.url) { return false }
    },
    editable: true,
    eventLimit: true, // allow "more" link when too many events
    events: '/bookings'
    });
  /*---end Selectable fullcalendar---*/

  /*---calendar2---*/
    $('#calendar2').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'listDay,listWeek,month'
      },

      views: {
        listDay: { buttonText: 'list day' },
        listWeek: { buttonText: 'list week' }
      },

      defaultView: 'listWeek',
      defaultDate: current_date,
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: '/bookings'
    });
    /*---end calendar2---*/
  });
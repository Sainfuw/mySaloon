	
/*---Selectable calendar---*/
$(document).on('turbolinks:load', function() {
  var current_date = moment().format("YYYY-MM-DD");
	$('#calendar').fullCalendar({
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
    defaultDate: current_date,
    navLinks: true, // can click day/week names to navigate views
    selectable: true,
    selectHelper: true,
    select: function(start, end) {
      var title = prompt('Titulo del evento:');
      var eventData;
      if (title) {
        eventData = {
          title: title,
          start: start,
          end: end
        };
        $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
      }
      $('#calendar').fullCalendar('unselect');
    },
    editable: true,
    eventLimit: true, // allow "more" link when too many events
    events: [
      {
        title: 'Primer evento',
        start: current_date
      },
      {
        title: 'Otro evento',
        start: current_date
      }
    ]
    });

    $('#calendar2').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'listDay,listWeek,month'
      },

      // customize the button names,
      // otherwise they'd all just say "list"
      views: {
        listDay: { buttonText: 'list day' },
        listWeek: { buttonText: 'list week' }
      },

      defaultView: 'listWeek',
      defaultDate: current_date,
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [
        {
          title: 'Primer evento',
          start: current_date
        },
        {
          title: 'Otro evento',
          start: current_date
        }
      ]
    });
  });
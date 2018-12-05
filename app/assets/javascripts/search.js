$(document).on('turbolinks:load', function() {
  if ($('#billings').length > 0) {
    $("[name=searchBar]").keypress(function(event) {
      $.ajax({
        url: '/billings',
        type: 'GET',
        dataType: 'script',
        data: { searchBar: $(this).val() }
      });
    });
  }
  if ($('#users').length > 0) {
    $("[name=searchBar]").keypress(function(event) {
      $.ajax({
        url: '/users',
        type: 'GET',
        dataType: 'script',
        data: { searchBar: $(this).val() }
      });
    });
  }
  if ($('#services').length > 0) {
    $("[name=searchBar]").keypress(function(event) {
      $.ajax({
        url: '/services',
        type: 'GET',
        dataType: 'script',
        data: { searchBar: $(this).val() }
      });
    });
  }
  if ($('#customers').length > 0) {
    $("[name=searchBar]").keypress(function(event) {
      $.ajax({
        url: '/customers',
        type: 'GET',
        dataType: 'script',
        data: { searchBar: $(this).val() }
      });
    });
  }
});
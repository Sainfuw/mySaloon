function initAutoComplete() {
  var input = document.getElementById('autoComplete');
  var options = {
    types: ['address'],
    componentRestrictions: { country: 'cl' }
  };
  var autocomplete = new google.maps.places.Autocomplete(input, options);
}
$(document).on('turbolinks:load', function() {
  if ($('#autoComplete').length > 0) {
  }
});
function initMap() {
  var input = $("#map");
  var lat = parseFloat(input.attr('data-latitude'));
  var lng = parseFloat(input.attr('data-longitude'));
  var map = new google.maps.Map(input.get(0), {
    center: { lat: lat, lng: lng },
    zoom: 18
  });
  marker = new google.maps.Marker({
    map: map,
    draggable: true,
    animation: google.maps.Animation.DROP,
    position: { lat: lat, lng: lng }
  });
  marker.addListener('click', toggleBounce);
}

function toggleBounce() {
  if (marker.getAnimation() !== null) {
    marker.setAnimation(null);
  } else {
    marker.setAnimation(google.maps.Animation.BOUNCE);
  }
}
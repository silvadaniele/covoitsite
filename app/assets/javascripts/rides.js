$(document).ready(function(){
  $('.datetimepicker').datetimepicker();
});

function initializeAutocomplete(cssClass) {
  var elements = document.getElementsByClassName(cssClass);
  if (elements.length > 0) {
    for (var i = 0 ; i <= elements.length ; i++) {
      var element = elements[i];
      var autocomplete = new google.maps.places.Autocomplete(
        element,
        {
          types: ['(cities)'],
          componentRestrictions: {
            country: "fr"
          }
        }
      );
      // google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChange)
    }
  }
}


google.maps.event.addDomListener(window, 'load', function() {
  initializeAutocomplete('google-place-autocomplete');
});



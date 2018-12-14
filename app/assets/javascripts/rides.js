$(document).ready(function(){
});

function initializeAutocomplete(cssClass) {
  var elements = document.getElementsByClassName(cssClass);
  if (elements.length > 0) {
    for (var i = 0 ; i <= elements.length ; i++) {
      var element = elements[i];
      console.log(element);
      var autocomplete = new google.maps.places.Autocomplete(
        element,
        {
          types: ['geocode']
        }
      );
      console.log(autocomplete);
      // google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChange)
    }
  }
}


google.maps.event.addDomListener(window, 'load', function() {
  initializeAutocomplete('google-place-autocomplete');
});

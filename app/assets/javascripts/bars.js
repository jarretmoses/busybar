'use strict';

var map;

function insertMap(latitude, longitude) {
    var mapCanvas = document.getElementById('map_canvas');
    var myLatlng = new google.maps.LatLng(latitude, longitude)
    var mapOptions = {
      center: myLatlng,
      zoom: 17,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(mapCanvas, mapOptions);
    var marker = new google.maps.Marker({
      position: myLatlng,
      map: map
  });
};

function codeAddress(street) {
    var geocoder = new google.maps.Geocoder();
    var address = street + " New York, NY"
    geocoder.geocode( {'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            var lat = results[0].geometry.location.lat();
            insertMap(lat, lon);
        }
    });
}


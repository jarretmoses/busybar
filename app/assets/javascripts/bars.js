'use strict;'
function GMap(){
  this.$map = $('#map_canvas');
  this.address = $('h3').text();
};

GMap.prototype.insertMap = function(latitude, longitude){
   var canvas = this.$map[0];
   var myLatlng = new google.maps.LatLng(latitude, longitude);
   var mapOptions = {
     center: myLatlng,
     zoom: 15,
     mapTypeId: google.maps.MapTypeId.ROADMAP
   }
   debugger;
   var map = new google.maps.Map(canvas, mapOptions);
   var marker = new google.maps.Marker({
     position: myLatlng,
     map: map
   });
};

GMap.prototype.codeAddress = function(street){
   var geocoder = new google.maps.Geocoder();
   var address = street + " New York, NY";
   geocoder.geocode( {'address': address}, function(results, status) {
           var lat = results[0].geometry.location.lat();
           var lon = results[0].geometry.location.lng();
           debugger;
           this.insertMap(lat, lon);
       }.bind(this));
};



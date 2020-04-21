<template>
  <div class="home">
    <div class="map">

    </div>


    <h1 class="app-title">WalkPHL</h1>
    <p>You must be authenticated to see this</p>
  </div>
</template>

<script>
import GoogleMapsLoader from 'google-maps-api-loader';

export default {
  name: 'home',


mounted()  {
    GoogleMapsLoader.load(function(google) {
      var uluru = {lat: -25.344, lng: 131.036};
      let map = new google.maps.Map(document.getElementById('map'), {
        zoom: 15,
        center: uluru});
        var marker = new google.maps.Marker({position: uluru, map: map});   
    })

},

}
</script>

<script async defer>
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTH-uqyQy7p8oz1hiDeYXFcSnefPoVTqI&callback=initMap"
</script>

<style scoped>
.app-title {
  font-family: 'Source Sans Pro', Arial, sans-serif;
}

@media only screen and (max-width: 768px) {

}

@media only screen and (min-width: 768px) {

}

 #map {
   width: 100%;
   height: 400px;
   background-color: grey;
 }
</style>
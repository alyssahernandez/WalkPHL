<template>
  <div class="home">
    <div class="map">
      <GmapMap
        :center="{lat:39.9526, lng:-75.1652}"
        :zoom="7"
        map-type-id="terrain"
        style="width: 500px; height: 300px"
      >
        <GmapMarker
          :key="index"
          v-for="(m, index) in markers"
          :position="m.position"
          :clickable="true"
          :draggable="true"
          @click="center=m.position"
        />
      </GmapMap>
    </div>
    <h1 class="app-title">WalkPHL</h1>
    <p>You must be authenticated to see this</p>
  </div>
</template>

<script>
//import GoogleMapsLoader from 'google-maps-api-loader';

export default {
  name: 'home',


mounted()  {
    this.$refs.mapRef.$mapPromise.then((map) => {
      map.panTo({lat: 1.38, lng: 103.80})
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
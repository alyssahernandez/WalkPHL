<template>
  <div class="home">
    <div class="container">
      <h1 class="app-title-landing">WalkPHL</h1>
      <p>You must be authenticated to see this</p>
      <button class="button is-rounded blue-green-gradient-vertical">Start Exploring</button>
      <map-widget></map-widget>
    </div>
  </div>
</template>

<script>
import MapWidget from '@/components/MapWidget'

export default {
  name: 'Home',
  components: {
    MapWidget
  }
  
  }
</script>

<style scoped>


body {
  margin: 0;
  padding: 0;
}

.home {
  width: 100vw;
  height: 100vh;
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
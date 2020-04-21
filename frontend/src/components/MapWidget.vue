<template>
  <div id="app">
    <div class="map-widget"></div>
  </div>
</template>

<script>
import gmapsInit from './utils/gmaps'
export default {
    name: 'map-widget',
    data() {

    },
    async mounted() {
    try {
      const google = await gmapsInit();
      const geocoder = new google.maps.Geocoder();
      const map = new google.maps.Map(this.$el);

      geocoder.geocode({ address: 'Austria' }, (results, status) => {
        if (status !== 'OK' || !results[0]) {
          throw new Error(status);
        }

        map.setCenter(results[0].geometry.location);
        map.fitBounds(results[0].geometry.viewport);
      });

      
      
    } catch (error) {
      console.error(error);
    }
  }
}
</script>


<style>
@import url('https://fonts.googleapis.com/css2?family=Francois+One&display=swap');


#app {
  width: 100vw;
  height: 100vh;
}

@media only screen and (max-width: 768px) {
    #app {
       
    }

}

@media only screen and (min-width: 768px) {
    #app {
        
    }
}
</style>
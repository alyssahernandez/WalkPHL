<template>
  <div id="app">
      <div class="map-widget"></div>
  </div>
</template>

<script>
import gmapsInit from './../utils/gmaps';

import MarkerClusterer from '@google/markerclusterer';

/*
const locations = [
  {
    position: {
      lat: 39.9656,
      lng: -75.1810,
    },
  },
  {
    position: {
      lat: 39.9496,
      lng: -75.1503,
    },
  },
  {
    position: {
      lat: 39.9526,
      lng: -75.1652,
    },
  },
  {
    position: {
      lat: 39.9526,
      lng: -75.1681,
    },
  },
  {
    position: {
      lat: 39.9533,
      lng: -75.1594,
    },
  }
];
*/

export default {
    name: 'map-widget',
    data() {

    },
async mounted() {
    try {
      const google = await gmapsInit();
      const geocoder = new google.maps.Geocoder();
      const map = new google.maps.Map(this.$el);
      geocoder.geocode({ address: `Center City, Philadelphia` }, (results, status) => {
        if (status !== `OK` || !results[0]) {
          throw new Error(status);
        }
        map.setCenter(results[0].geometry.location);
        map.fitBounds(results[0].geometry.viewport);
      });
      const markerClickHandler = (marker) => {
        map.setZoom(13);
        map.setCenter(marker.getPosition());
      };
      const markers = locations
        .map((location) => {
          const marker = new google.maps.Marker({ ...location, map });
          marker.addListener(`click`, () => markerClickHandler(marker));
          return marker;
        });
      // eslint-disable-next-line no-new;
    } catch (error) {
      // eslint-disable-next-line no-console
      console.error(error);
    }
  },
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
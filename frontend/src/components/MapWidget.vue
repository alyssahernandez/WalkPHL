<template>
      <div id="app" class="map-widget"></div>
</template>

<script>
import gmapsInit from './../utils/gmaps';

/*
const DirectionRequests = [
    {
      origin: 'City Hall, Philadelphia',
      destination: 'Philadelphia Museum of Art',
      travelMode: 'WALKING',
      provideRouteAlternatives: true,
    },
    {
      origin: 'City Hall, Philadelphia',
      destination: 'Reading Terminal Market',
      travelMode: 'WALKING',
      provideRouteAlternatives: true,
    },
    {
      origin: 'City Hall, Philadelphia',
      destination: 'Liberty Bell, Philadelphia',
      travelMode: 'WALKING',
      provideRouteAlternatives: true,
    },
    {
      origin: 'Liberty Bell, Philadelphia',
      destination: 'City Hall, Philadelphia',
      travelMode: 'WALKING',
      provideRouteAlternatives: true,
    },
];
*/

// TODO: Method that fetches these from DB, stores in locations array in data(). Iterate thru that. 
const locations = [
  {
    name: 'art museum',
    category: 'art',
    position: {
      lat: 39.9656,
      lng: -75.1810,
    },
  },
  {
    name: 'liberty bell',
    category: 'sight',
    position: {
      lat: 39.9496,
      lng: -75.1503,
    },
  },
  {
    name: 'city hall',
    category: 'info',
    position: {
      lat: 39.9526,
      lng: -75.1652,
    },
  },
  {
    name: "observation deck",
    category: 'sight',
    position: {
      lat: 39.9526,
      lng: -75.1681,
    },
  },
  {
    name: 'reading terminal',
    category: 'food',
    position: {
      lat: 39.9533,
      lng: -75.1594,
    },
  },
  {
    name: 'tech elevator',
    category: 'secret',
    position: {
      lat: 39.949390,
      lng: -75.169212
    }
  },
  {
    name: 'spruce park',
    category: 'park',
    position: {
      lat: 39.943729,
      lng: -75.142029
    }
  },
  {
    name: 'camden',
    category: 'gtfo',
    position: {
      lat: 39.9259, 
      lng: -75.1196
    }
  }
];

export default {
  name: 'map-widget',
  async mounted() {
    try {
      const google = await gmapsInit();
      const geocoder = new google.maps.Geocoder();
      const map = new google.maps.Map(this.$el);
      
      var icons = {
        artcon: { icon: {url: 'http://maps.google.com/mapfiles/kml/shapes/arts.png', scaledSize: new google.maps.Size(35, 35)}},
        sightcon: { icon: {url: 'http://maps.google.com/mapfiles/kml/shapes/camera.png', scaledSize: new google.maps.Size(28, 28)} },
        foodcon: {icon: {url: 'http://maps.google.com/mapfiles/kml/pal2/icon37.png', scaledSize: new google.maps.Size(28, 28)}},
        infocon: { icon: {url: 'http://maps.google.com/mapfiles/kml/shapes/info.png', scaledSize: new google.maps.Size(28, 28)}},
        secretcon: { icon: { url: 'http://maps.google.com/mapfiles/kml/shapes/info_circle.png', scaledSize: new google.maps.Size(28, 28)}},
        parkcon: { icon: { url: 'http://maps.google.com/mapfiles/kml/pal2/icon4.png', scaledSize: new google.maps.Size(28, 28)}},
        camdencon: { icon: { url: 'http://maps.google.com/mapfiles/kml/pal3/icon37.png', scaledSize: new google.maps.Size(50, 50) }}
      };

      geocoder.geocode({ address: `Center City, Philadelphia` }, (results, status) => {
        if (status !== `OK` || !results[0]) {
          throw new Error(status);
        }
        map.setCenter(results[0].geometry.location);
        map.fitBounds(results[0].geometry.viewport);
      });
      const markerClickHandler = (marker) => {
        map.setZoom(17);
        map.setCenter(marker.getPosition());
      };

      // you'd think you could set .addListener & return at the bottom, declare 'marker' outside of the block so it's in scope.  Nope!  Maybe I'm just being dumb, but gotta call everything inside for clicking/zoom to work properly
      const markers = locations
        .map((location) => {
          let marker = '';
          marker = new google.maps.Marker({position: new google.maps.LatLng(location.position.lat, location.position.lng), map, draggable: false,animation: google.maps.Animation.BOUNCE, icon: icons[location.category + 'con'].icon});
          marker.addListener(`click`, () => markerClickHandler(marker));
          return marker;
        });
      
      // eslint-disable-next-line no-new
    } catch (error) {
      // eslint-disable-next-line no-console
      console.error(error);
    }
  },
};
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


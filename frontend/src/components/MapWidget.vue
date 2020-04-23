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
    name: 'Philadelphia Museum of Art',
    category: 'art',
        content: '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h1 id="firstHeading" class="firstHeading">Philadelphia Museum of Art</h1>'+
      '<div id="bodyContent">'+
      '<p><b>The Philadelphia Museum of Art</b> was pretty awesome and I want to go back.</p>'+
      '<a style="color:blue" target="_blank" href="https://en.wikipedia.org/wiki/Philadelphia_Museum_of_Art">View on Wikipedia</a> '+
      '</div>'+
      '</div>',
    position: {
      lat: 39.9656,
      lng: -75.1810,
    },
  },
  {
    name: 'Liberty Bell',
    category: 'sight',
        content: '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h1 id="firstHeading" class="firstHeading">Liberty Bell</h1>'+
      '<div id="bodyContent">'+
      '<p><b>The Liberty Bell</b>. Neato.</p>'+
      '<a style="color:blue" target="_blank" href="https://en.wikipedia.org/wiki/Liberty_Bell">View on Wikipedia</a>'+
      '</div>'+
      '</div>',
    position: {
      lat: 39.9496,
      lng: -75.1503,
    },
  },
  {
    name: 'City Hall',
    category: 'info',
        content: '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h1 id="firstHeading" class="firstHeading">City Hall</h1>'+
      '<div id="bodyContent">'+
      '<p><b>City Hall</b>... akwdawkdhawkjd,awdkawda </p>'+
      '<a style="color:blue" target="_blank" href="https://en.wikipedia.org/wiki/Philadelphia_City_Hall">View on Wikipedia</a>'+
      '</div>'+
      '</div>',
    position: {
      lat: 39.9526,
      lng: -75.1652,
    },
  },
  {
    name: "One Liberty Observation Deck",
    category: 'sight',
        content: '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h1 id="firstHeading" class="firstHeading">One Liberty Observation Deck</h1>'+
      '<div id="bodyContent">'+
      '<p><b>One Liberty Observation Tower</b> is a tower that\'s supposedly sick for July 4 </p>'+
      '<a style="color:blue" target="_blank" href="https://en.wikipedia.org/wiki/One_Liberty_Observation_Deck">View on Wikipedia</a> '+
      '</div>'+
      '</div>',
    position: {
      lat: 39.9526,
      lng: -75.1681,
    },
  },
  {
    name: 'Reading Terminal Market',
    category: 'food',
    content: '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h1 id="firstHeading" class="firstHeading">Reading Terminal Market</h1>'+
      '<div id="bodyContent">'+
      '<p><b>Reading Terminal Market</b> <3 </p>'+
      '<a style="color:blue" target="_blank" href="https://en.wikipedia.org/wiki/Reading_Terminal_Market">View on Wikipedia</a>'+
      '</div>'+
      '</div>',
    position: {
      lat: 39.9533,
      lng: -75.1594,
    },
  },
  {
    name: '???????',
    category: 'secret',
        content: '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h1 id="firstHeading" class="firstHeading">What is this?!</h1>'+
      '<div id="bodyContent">'+
      '<p><b>Wuuuuuttttt</b></p>'+
      '<a style="color:blue" target="_blank" href="https://naigeis.com/images/Properties/DuaneMorrisPlaza/resizedimages/DuaneMorrisPlaza-02.jpg">An image</a>' +
      '</div>'+
      '</div>',
    position: {
      lat: 39.949390,
      lng: -75.169212
    }
  },
  {
    name: 'Spruce Street Harbor Park',
    category: 'park',
    content: '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h1 id="firstHeading" class="firstHeading">Spruce Street Harbor Park</h1>'+
      '<div id="bodyContent">'+
      '<p><b>Spruce Street Harbor Park Park</b> is a park</p>'+
      '<a href="https://en.wikipedia.org/wiki/Spruce_Street_Harbor_Park" style="color:blue" target="_blank">View on Wikipedia</a>' +
      '</div>'+
      '</div>',
    position: {
      lat: 39.943729,
      lng: -75.142029
    }
  },
  {
    name: 'Camden lol',
    category: 'camden',
    content: '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h1 id="firstHeading" class="firstHeading">Camden, NJ</h1>'+
      '<div id="bodyContent">'+
      '<p><b>Camden</b>...nope</p>'+
      '<a href="https://i.pinimg.com/originals/46/8f/86/468f86254482f11fb9e3668352e150d7.jpg" style="color:blue" target="blank">Yeeee</a>'+
      '</div>'+
      '</div>',
    position: {
      lat: 39.9259, 
      lng: -75.1196
    }
  }
];

export default {
    name: 'map-widget',
    data() {
      return {
        displayInfo: false
      }
    },
    methods: {
    },
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

        google.maps.Map.prototype.markers = new Array();

        google.maps.Map.prototype.getMarkers = function() {
            return this.markers
        };

        locations
          .map((location) => {
            let marker = '';
            marker = new google.maps.Marker({position: new google.maps.LatLng(location.position.lat, location.position.lng), map, title: location.name, draggable: false, animation: google.maps.Animation.BOUNCE, icon: icons[location.category + 'con'].icon});
            marker.addListener(`dblclick`, () => markerClickHandler(marker));
            let infowindow = new google.maps.InfoWindow({ content: location.content });
              marker.addListener('click', function() {
                if (!this.displayInfo) {
                  infowindow.open(map, marker);
                  this.displayInfo = !this.displayInfo;
                } else {
                  infowindow.close(map, marker);
                  this.displayInfo = !this.displayInfo;
                }
              });
            return marker;
          });

        const start = new google.maps.LatLng(locations[0].position.lat, locations[0].position.lng);
        const end = new google.maps.LatLng(locations[4].position.lat, locations[4].position.lng);

        const directionsService = new google.maps.DirectionsService(); 
        const directionsDisplay = new google.maps.DirectionsRenderer();// also, constructor can get "DirectionsRendererOptions" object
        
        directionsDisplay.setMap(map); // map should be already initialized.

        const request = {
            origin : start,
            destination : end,
            travelMode : google.maps.TravelMode.DRIVING
        };

        directionsService.route(request, function(response, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                directionsDisplay.setDirections(response);
            }
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


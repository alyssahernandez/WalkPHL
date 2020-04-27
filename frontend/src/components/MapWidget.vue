<template>
      <div id="app" class="map-widget">
        <!-- <div id="swiper" v-touch:swipe.top="swipeUpSidebar" v-touch:swipe.bottom="swipeDownSidebar"> -->
        <div v-show="panel" id="right-panel">
          <div class="location-buttons">
            <button id="dir" class="button is-primary" v-on:click="showDirectionsToDestination">Get Directions</button>
            <button class="button is-primary button-2" v-if="userLoggedIn" v-on:click="reviewButtonClicked">Show Reviews</button>
            <button class="button is-primary button-3" v-if="userLoggedIn">Check-In</button>
            
            <select id="type">
              <option disabled selected value> -- select -- </option>
              <option value="WALKING">Walk PHL!</option>
              <option value="BICYCLING">Bicycle</option>
              <option value="DRIVING">Drive</option>
              <option value="TRANSIT">Public Transit</option>
            </select >
            <select id="radius">
              <option disabled selected value> -- select -- </option>
              <option value="250">250 Meters</option>
              <option value="804">Half Mile</option>
              <option value="1607">One Mile</option>
              <option value="3214">Two Miles</option>
              <option value="8046">Five Miles</option>
              <option value="16093">Ten Miles</option>
            </select>
            <select id="end">
              <option disabled selected value> -- select -- </option>
              <option v-for="destination in destinations" v-bind:id="destination.destinationId" :key="destination.destinationId" v-bind:value="destination.name">{{destination.name}}</option>
            </select>

          </div>
            <div id="destination-div">
              <div class="container">
                <div class="box" v-for="destination in destinations" :key="destination.destinationId" v-on:click="showDestinationInfo(destination)">
                   <img :src="`${destination.imgUrl}`" />
                   <h4>{{destination.name}}</h4>
                   <p>{{destination.description}}</p>
                   <p>{{destination.openFrom}} - {{destination.openTo}} - Weekends:{{destination.openOnWeekends}}</p>
                </div>
              </div>
            </div>
            <div v-if="this.displayReviews" id="review-div">
              <div class="container">
                <div class="box" v-for="review in reviews" :key="review.review_id">
                  <article class="media">
                    <div class="media-left">
                      <figure class="image is-64x64">
                        <img src="https://bulma.io/images/placeholders/128x128.png" alt="Image">
                      </figure>
                    </div>
                  <div class="media-content">
                    <div class="content">
                      <p>
                        <strong>{{review.username}}</strong>
                        <br>
                        <br>
                        <strong>{{review.title}}</strong>
                        <br>
                        {{review.review}}
                      </p>
                  </div>
                  <nav class="level is-mobile">
                    <div class="level-left">
                      <p class="level-item">
                        <span>
                          {{review.review_date}}
                        </span>
                      </p>
                    </div>
                  </nav>
                </div>
              </article>
            </div>
          </div>
              <form @submit.prevent="leaveReview" v-if="userLoggedIn">
                <p><strong>Leave a review?</strong></p>
                <label for="title">
                  <input 
                    type="text"
                    v-model="review.title"
                    placeholder="Review Title"
                    id="title"
                    class="input"
                    maxlength="40"
                    required
                    autofocus
                  />
                </label>
                <label for="review">
                  <textarea
                    type="text"
                    v-model="review.review"
                    placeholder="Review..."
                    id="review" 
                    class="textarea is-primary"
                    maxlength="255"
                    required
                    autofocus>
                  </textarea>
                </label>
                <button class="button" type="submit">Submit Review</button>
              </form>
            </div>
          </div>
          <div id="map" v-bind:class="{'maps': panel}"></div>
      </div>
      

</template>

<script>
import gmapsInit from './../utils/gmaps';
import auth from '../auth';

export default {
    name: 'map-widget',
    components: {
      
    },
    data() {
      return {
        hasPosition: false,
        num: 1,
        displayInfo: false,
        displayReviews: false,
        destinationPosition: {
          lat: '',
          lng: ''
        },
        destinationName: '',
        review: {
          username: auth.getUser().sub,
          title: '',
          review: '',
        },
        user: '',
        reviews: null,
        destinations: null,
        pos: {
          lat: '',
          lng: ''
        },
      }
    },
    props: {
      panel: Boolean
    },
    computed: {
      userLoggedIn() {
        return (auth.getToken() != null);
      },
      // Filters locations by radius (meters). Markers are only shown within a certain distance of user.
      filterLocations() {
        document.getElementById('radius').addEventListener('change', function() {

        })
        return locations.filter( (location) => {
          var R = 6371000;
          var dLat = this.toRad(location.position.lat-this.coords.lat);
          var dLon = this.toRad(location.position.lng-this.coords.lng);
          var lat1 = this.toRad(this.coords.lat);
          var lat2 = this.toRad(location.position.lat);

          var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
                  Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2); 
          var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
          var d = R * c;

          if (d <= 3500) return location;
        })
      },
    },
    methods: {
      getReviews() {
        fetch(`${process.env.VUE_APP_REMOTE_API}/recent-reviews`, {
          method: 'GET',
          headers: {
            Authorization: 'Bearer ' + auth.getToken()
          }
        })
        .then((response) => {
          if(response.ok) {
            console.log(response);
            return response.json();
          }
        })
        .then((reviews) => {
          console.log(reviews);
          this.reviews = reviews;
        })
        .catch(err => {console.log(err)})
      },
      swipeUpSidebar() {
        let swipeDiv = document.getElementById("swiper");
        swipeDiv.classList.add('swipeUp');
      },
      swipeDownSidebar() {
        let swipeDiv = document.getElementById("swiper");
        swipeDiv.classList.add('swipeDown');
      },
      toRad(degree) {
        return degree * Math.PI / 180;
      },
      showMapView() {
        let whiteOverlay = document.getElementById("map-static");
        whiteOverlay.style.opacity = '0';
        setTimeout(function(){whiteOverlay.parentNode.removeChild(whiteOverlay);}, 2000);

        let mobileMapOverlay = document.getElementById("mobile-map-overlay");
        mobileMapOverlay.classList.add('fade');
        setTimeout(function(){mobileMapOverlay.parentNode.removeChild(mobileMapOverlay);}, 2000);
        
        let greyscaleMap = document.getElementById("landing-page-map");
        greyscaleMap.classList.add('greyscale-click');

        let infoBlock = document.getElementById("app-info-block");
        infoBlock.classList.add('fade');
        setTimeout(function(){infoBlock.parentNode.removeChild(infoBlock);}, 2000);

      },
      leaveReview() {
        fetch(`${process.env.VUE_APP_REMOTE_API}/api/leave-review`, {
          method: 'POST',
          headers: {
            Authorization: 'Bearer ' + auth.getToken(),
            Accept: 'application/json',
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(this.review)
        })
        .then((response) => {
          if(response.ok) {
            this.$router.push({ path: '/reviews'});
            console.log("success! review posted");
          } else {
          console.log("error leaving review");
          }
        })
        .then((err) => console.log(err));
      },
      getDestinations() {

      },
      reviewButtonClicked() {
        this.displayReviews = !this.displayReviews;
      },
      showDestinationInfo(destination) {
        console.log(destination);
        this.destinationPosition.lat = destination.lat; 
        this.destinationPosition.long = destination.lng;
        console.log(this.destinationPosition);
      },
      calculateAndDisplayRoute(directionsService, directionsRenderer) {
        console.log("method reached");
        directionsService.route({
            origin : this.pos,
            destination : this.destinationPosition,
            travelMode : 'WALKING'
        }, 
          
        function(response, status) {
          if (status === 'OK') {
            directionsRenderer.setDirections(response);
            console.log("directinsRendererer reached");
          } else {
            window.alert('Directions request failed due to ' + status);
          }
        });
      },
      showDirectionsToDestination() {
        
        
        this.calculateAndDisplayRoute(this.directionsService, this.directionsRenderer);
      }
    },


    created() {
      this.reviews = this.getReviews();
      this.destinations = fetch(`${process.env.VUE_APP_REMOTE_API}/destinations`, {
          method: 'GET',
          headers: {
            Authorization: 'Bearer ' + auth.getToken()
          }
        })
        .then((response) => {
          if(response.ok) {
            console.log(response);
            return response.json();
          }
        })
        .then((destinations) => {
          console.log(destinations);
          this.destinations = destinations;
        })
        .catch(err => {console.log(err)});
    },
    async mounted() {

        // Initialization of Maps objects
        const google = await gmapsInit();
        const geocoder = new google.maps.Geocoder();
        const map = new google.maps.Map(document.getElementById('map'));
        //const places = new google.maps.places.PlacesService(map);
        const directionsService = new google.maps.DirectionsService();
        this.directionsService = directionsService;
        console.log(directionsService);
        console.log(this.directionsService);
        var directionsRenderer = new google.maps.DirectionsRenderer();
        this.directionsRenderer = directionsRenderer;
      
        directionsRenderer.setPanel(document.getElementById('right-panel'));
        directionsRenderer.setMap(map); 
        
        // Map icons
        var icons = {
          artcon: { icon: {url: 'http://maps.google.com/mapfiles/kml/shapes/arts.png', scaledSize: new google.maps.Size(35, 35)}},
          sightcon: { icon: {url: 'http://maps.google.com/mapfiles/kml/shapes/camera.png', scaledSize: new google.maps.Size(28, 28)} },
          foodcon: {icon: {url: 'http://maps.google.com/mapfiles/kml/pal2/icon37.png', scaledSize: new google.maps.Size(28, 28)}},
          infocon: { icon: {url: 'http://maps.google.com/mapfiles/kml/shapes/info.png', scaledSize: new google.maps.Size(28, 28)}},
          secretcon: { icon: { url: 'http://maps.google.com/mapfiles/kml/shapes/info_circle.png', scaledSize: new google.maps.Size(28, 28)}},
          parkcon: { icon: { url: 'http://maps.google.com/mapfiles/kml/pal2/icon4.png', scaledSize: new google.maps.Size(28, 28)}},
          camdencon: { icon: { url: 'http://maps.google.com/mapfiles/kml/pal3/icon37.png', scaledSize: new google.maps.Size(50, 50) }}
        };

        // Geocoder is grabbing places that match our address search. It returns an array, but given we're specific, it will only be of size one.
        // We reference our search it with results[0], and declare the map to be centered on the location of our search (Center City)
        geocoder.geocode({ address: `Center City, Philadelphia` }, (results, status) => {
          if (status !== `OK` || !results[0]) {
            throw new Error(status);
          }
          map.setCenter(results[0].geometry.location);
          map.fitBounds(results[0].geometry.viewport);
         });

         // This sets the zoom when a marker is clicked on & centers the map on that marker
        const markerClickHandler = (marker) => {
          map.setZoom(17);
          map.setCenter(marker.getPosition());
        };

        // Getting an array of markets to plop on our map
        var markers = [];

        // TODO: We shouldn't be calling "locations" like this. In order for this to work, Locations must be declared inside of our script.
        // That's not ideal, especially for referencing things from our DB.  
        // It has to do with async mounting -- was reading about it all night.  Not entirely sure of the solution, however, tho I think we may need to fetch in here & have everything else wait on the response.

        // This iterates over our filtered locations (also had to declare the Filter method here rather than in "methods")
        // On each location, it plants an icon and places an info window on the marker (on click)
        function addMarker(location) {
          var marker = new google.maps.Marker({position: new google.maps.LatLng(location.latitude, location.longitude), map, title: location.name, draggable: false, icon: icons['artcon'].icon});
          marker.addListener(`dblclick`, () => markerClickHandler(marker));
          let infowindow = new google.maps.InfoWindow({ content: name });
          marker.addListener('click', function() {
          if (!this.displayInfo) {
            infowindow.open(map, marker);
            this.displayInfo = !this.displayInfo;
          } else {
            infowindow.close(map, marker);
            this.displayInfo = !this.displayInfo;

            }
          }); 
          markers.push(marker);
        }
        
        this.destinations
        .map((location) => {     
            addMarker(location);
        });
        

        // The next few lines requests a user's position (I was using Vue's before; this is Google's)
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };

            // this.pos.lat = pos.lat; // ALLLLLLLLLLLLLLL WEEEEEE NEEEEEEEEEEEEEEEEEEEED IS TO GET THIS IN SCOPEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
            // this.pos.lng = pos.lng; // IT'S NOT READING DESTINATION POSITION

            // This sets an infowindow on our current location.
            var infoWindow = new google.maps.InfoWindow;
            infoWindow.setPosition(pos);
            infoWindow.setContent('Oh, there you are! Haiii');
            infoWindow.open(map);
            map.setCenter({lat: 39.9526, lng: -75.1652});
            map.setZoom(14);

            document.getElementById('radius').addEventListener('change', function() {
              for(var i = 0; i < markers.length; i++){
                  markers[i].setMap(null);
              }
              this.destinations
                .map((location) => {     
                  if (filterEm(location) <= document.getElementById('radius').value) {
                    addMarker(location);
                  }
              });
            })

            // // Function to display route
             var onChangeHandlerDirections = function() {
               calculateAndDisplayRoute(directionsService, directionsRenderer);
             }

            // // Adding an on-click to our "Get Directions" button, which runs the above function on click & removes directions upon re-clicking
             document.getElementById('dir').addEventListener('click', function() {
                   if (directionsRenderer.map != null) {
                    directionsRenderer.setMap(null);
                    directionsRenderer.setPanel(null);
                   } else {
                      directionsRenderer.setPanel(document.getElementById('right-panel'));
                      directionsRenderer.setMap(map); 
                      onChangeHandlerDirections;
                   }
             });

             // Event listeners for menu selections (destination/endpoint, mode of transportation, and radius from user)
             document.getElementById('end').addEventListener('change', onChangeHandlerDirections);
             document.getElementById('type').addEventListener('change', onChangeHandlerDirections);
             
             // Calculates route from user position and that of a destination.
             function calculateAndDisplayRoute(directionsService, directionsRenderer) {

               var end = document.getElementById('end').value;
               var type = document.getElementById('type').value;
              
               directionsService.route({
                    origin : pos,
                    destination : end,
                    travelMode : type
                }, function(response, status) {
                  if (status === 'OK') {
                    directionsRenderer.setDirections(response);
                  } 
                });
              
             }
            
            // Had to move our "filter by distance" method down here. Wouldn't work when calling above.
            // Also had to put our "toRad()" method inside of it, as it would only return undefined values...more async mount strangeness
            function filterEm(location) {
              var R = 6371000;
              var dLat = Math.PI / 180 * (location.position.lat - pos.lat);
              var dLon = Math.PI / 180 * (location.position.lng - pos.lng);
              var lat1 = Math.PI / 180 * (pos.lat);
              var lat2 = Math.PI / 180 * (pos.lng);
              var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
                      Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2); 
              var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
              var d = R * c;
              return d;
            }
          });
        }

    }
}

// TODO: Method that fetches these from DB, stores in locations array in data(). Iterate thru that. 
// These are only able to be referenced when declared inside of the script -- doesn't work when a data() field, even if initialized in the created() method.
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
    name: 'Duane Morris Plaza',
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
</script>


<style>
@import url('https://fonts.googleapis.com/css2?family=Francois+One&display=swap');

.hide-form {
  display: none;
}

#app {
  width: 100vw;
  height: 100vh;
}

.map-widget {
  padding-top: 5rem;
}

.swipeUp {
  animation-name: swipeUp;
  animation-duration: 0.5s;
}

@keyframes swipeUp {
  0% {
    bottom:-50px
  }
  100% {
    bottom:0;
  }
}

.swipeDown {
  animation-name: swipeDown;
  animation-duration: 0.5s;
}

@keyframes swipeDown {
  0% {
    top: 0px;
  }
  100% {
    top: 50px;
  } 
}

@media only screen and (max-width: 768px) {
   .location-buttons {
     display: grid;
     grid-template-columns: 1fr;
     
   }

  #right-panel {
    height: 100%;
    float: right;
    width: 100%;
    overflow: auto;
  }

}

@media only screen and (min-width: 768px) {


  .location-buttons {
    display: grid;
    grid-template-columns: 3fr;
    grid-gap: 1em;
  }

  .button-1 {
    grid-column: 1 / 1;
    padding: 1em;
  }

  .button-2 {
    grid-column: 2 / 2;
    padding: 1em;
  }

  .button-3 {
    grid-column: 3 / 3;
    padding: 1em;
  }

  #right-panel {
    height: 100%;
    float: right;
    width: 25%;
    overflow: auto;
  }

}

/* Always set the map height explicitly to define the size of the div
  * element that contains the map.*/ 
#map {
  height: 100%;
  padding-top: 5rem;
}

/* Optional: Makes the sample page fill the window. */
html, body {
  height: 100%;
  margin: 0;
  padding: 0;
}
#floating-panel {
  position: absolute;
  top: 10px;
  left: 25%;
  z-index: 5;
  background-color: #fff;
  padding: 5px;
  border: 1px solid #999;
  text-align: center;
  font-family: 'Roboto','sans-serif';
  line-height: 30px;
  padding-left: 10px;
}
#right-panel {
  font-family: 'Roboto','sans-serif';
  line-height: 30px;
  padding-left: 10px;
}

#right-panel select, #right-panel input {
  font-size: 15px;
}

#right-panel select {
  width: 100%;
}

#right-panel i {
  font-size: 12px;
}

.maps {
  margin-right: 400px;
}
#floating-panel {
  background: #fff;
  padding: 5px;
  font-size: 14px;
  font-family: Arial;
  border: 1px solid #ccc;
  box-shadow: 0 2px 2px rgba(33, 33, 33, 0.4);
  display: none;
}
@media print {
  #map {
    height: 500px;
    margin: 0;
  }
  #right-panel {
    float: none;
    width: auto;
  }
}
</style>
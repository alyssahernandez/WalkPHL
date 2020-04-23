<template>
  <div class="home">
    <map-widget class="static-map greyscale padding-from-nav" id="landing-page-map"></map-widget>
    <div id="map-static" class="map-overlay"></div>
    <div id="mobile-map-overlay"></div>
    <div class="map-inactive"></div>
    <div class="container landing-text" id="app-info-block">
      <div class="walkphl-wrap">
        <h1 class="app-title-landing mobile-landing-title">WalkPHL</h1>
      </div>
      <p class="browser-view-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      <p class="mobile-view-description blue-font">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      <button v-on:click="showMapView" class="button is-rounded is-primary explore-btn desktop-button">Start Exploring</button>
      <div class="mobile-buttons-div">
        <router-link class="have-account-link" :to="{ name: 'login' }">          
          <button class="button is-rounded is-primary mobile-button">Sign In</button>
        </router-link>
        <router-link class="need-account-link" :to="{ name: 'register' }">
          <button class="button is-rounded is-primary mobile-button">Sign Up</button>
        </router-link>        
        <p v-on:click="showMapView" class="mobile-view-description blue-font">Continue Without an Account</p>
      </div>
    </div>
  </div>
</template>

<script>
import MapWidget from "@/components/MapWidget";

export default {
  name: "Home",
  data() {
    return {
      askedLocation: false,
      coordinates: {
        lat: 0,
        lng: 0
      }
    }
  },
  props: {
    login: Boolean
  },
  components: {
    MapWidget
  },
  methods: {
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

      this.$getLocation({})
          .then(coordinates => {
            this.coordinates = coordinates;
            this.$emit('coords', coordinates);
          })
    },
  },
  created() {
  }
}
</script>

<style scoped>

.padding-from-nav {
  padding-top: 5rem;
}
.greyscale {
  transition: filter 2s ease-in-out;
  -webkit-filter: grayscale(100%);
  filter: grayscale(100%);
}

.greyscale-click {
  -webkit-filter: grayscale(0%);
  filter: grayscale(0%);
}

.browser-view-description {
  font-weight: bold;
  font-size: 1.2em;
  padding-bottom: 1em;
  text-shadow: 1px 1px 4px #FFFFFF;
}

.fade {
  animation-name: fadeUp;
  animation-duration: 2s;
}

@keyframes fadeUp {
  0% {
    top: 0px;
  }
  50% {
      top: 60%;
      opacity: 0;
    } 
  100% {
    top: 10px;
    opacity: 0;
  } 
}

body {
  margin: 0;
  padding: 0;
}

.home {
  width: 100vw;
  height: 100vh;
}

@media only screen and (max-width: 768px) {

  .blue-font {
    font-family: 'Francois One', sans-serif;
    color: #03b6fc;
  }


  .app-title-landing {
    font-family: 'Francois One', sans-serif;
    color: #03b6fc;
    font-size: 3em;
    text-align: center;
  }

  .mobile-landing-title {
    position: relative;
  }

  .desktop-button {
    display: none;
  }

  .browser-view-description {
    display: none;
  }

  .mobile-button {
    text-shadow: 1px 1px 4px #000000;
    width: 100%;
  }

  .landing-text {
    position: fixed;
    z-index: 2;
    margin-top: 39%;
    display: flex;
    flex-direction: column;
    justify-items: center;
    align-items: center;
  }

  #mobile-map-overlay {
    position: absolute;
    z-index: 1;
    width: 100vw;
    height: 50vh;
    background: white;
    opacity: 1;
    margin-top: 50vh;
    animation-name: fadeUp;
  }

    .map-overlay {
    transition: filter 5s ease-in-out;
    position: absolute;
    z-index: 1;
    width: 100%;
    height: 100%;
    background: white;
    opacity: 0.60;  
    -webkit-transition: opacity 2000ms linear;
    transition: opacity 2000ms linear;
  }

  .mobile-view-description {
    text-align: center;
    font-family: 'Nanum Gothic', sans-serif;
  }


  .static-map {
    width: 100%; 
    height: 90vh;
    position: absolute; /* this gets the map under the nav bar */
    top: 3.5rem; /* this too */
    left: 0;
    z-index: 0;
  }
}

@media only screen and (min-width: 768px) {

  #mobile-map-overlay {
    display: none;
  }

  .static-map {
    height: 100%;
    width: 100%;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 0;
  }

  .app-title-landing {
    font-family: 'Francois One', sans-serif;
    color: #03b6fc;
    font-size: 5.5em;
  }

  .mobile-view-description {
    display: none;
  }

  .mobile-buttons-div {
    display: none;
  }

  .landing-text {
    position: fixed;
    z-index: 2;
    margin-top: 17em;
    margin-left: 3em;
    width: 42%; 
  }

  .map-overlay {
    transition: filter 5s ease-in-out;
    position: absolute;
    z-index: 1;
    width: 100%;
    height: 100%;
    background: white;
    opacity: 0.60;  
    -webkit-transition: opacity 2000ms linear;
    transition: opacity 2000ms linear;
  }

  .mobile-button {
    display: none;
  }

}

#map {
  width: 100%;
  height: 400px;
  background-color: grey;
}

.mobile-buttons-div {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  height: 18vh;
  margin-top: 10vh;
  width: 80vw;
}
</style>
<template>
  <div class="home">
    <map-widget class="static-map"></map-widget>
    <div class="map-overlay"></div>
    <div class="container landing-text">
      <h1 class="app-title-landing">WalkPHL</h1>
      <p class="browser-view-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      <button class="button is-rounded is-primary explore-btn">Start Exploring</button>
    </div>
  </div>
</template>

<script>
import MapWidget from "@/components/MapWidget";

export default {
  name: "Home",
  components: {
    MapWidget
  }
};
</script>

<style scoped>
.static-map {
  height: 150%;
  width: 150%;
  position: absolute;
  top: 0;
  left: 0;
  z-index: 0;
  filter: grayscale(100%);
}

.browser-view-description {
  font-weight: bold;
  font-size: 1.2em;
  padding-bottom: 1em;
  text-shadow: 1px 1px 4px #FFFFFF;
}

.map-overlay {
  position: absolute;
  z-index: 1;
  width: 100%;
  height: 100%;
  background: white;
  opacity: 0.60;
}

.landing-text {
 position: fixed;
 z-index: 2;
 margin-top: 17em;
 margin-left: 3em;
 width: 42%; 
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
}

@media only screen and (min-width: 768px) {
}

#map {
  width: 100%;
  height: 400px;
  background-color: grey;
}
</style>
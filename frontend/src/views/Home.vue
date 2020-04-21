<template>
  <div class="home">
    


    <h1 class="app-title">WalkPHL</h1>
    <p>You must be authenticated to see this</p>
  </div>
</template>

<script>
//import GoogleMapsLoader from 'google-maps-api-loader';

export default {
  name: 'home',


}
</script>

<style scoped>
.app-title {
  font-family: 'Lobster', Arial, sans-serif;
}

.home {
  width: 100%;
  height: 100%;
  background: url('https://billypenn.com/wp-content/uploads/2019/04/transitlayer-02-800x450.png') no-repeat center;
  background-size: cover;
}

/*
.home:before {
  content: "";
  position: absolute;
  left: 0; right: 0;
  top: 0; bottom: 0;
  background: rgba(235, 235, 235, 0.5);
}
*/


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
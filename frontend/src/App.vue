<template>
  <div id="app">
    <div id="nav">
      <router-link to="/">Home</router-link>
      <router-link v-if="!loggedIn" to="/login">Login</router-link>
      <router-link v-if="loggedIn" to="/logout">Logout</router-link>
      
    </div>
    <router-view/>
    <div class="App"></div>
  </div>
</template>

<script>

import gmapsInit from './utils/gmaps';
import auth from '../src/auth';

export default {
  name: 'App',
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
  },

  components: {

  },
  computed: {
    loggedIn() {
      return auth.getToken;
    }
  }
  
}

</script>

<style>
#app {
  width: 100vw;
  height: 100vh;
}

.App {
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

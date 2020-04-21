<template>
  <div id="app">
    <div id="nav">
      <router-link to="/">Home</router-link>
      <div>
        <router-link v-if="!loggedIn" to="/login">Login</router-link>
        <a v-if="loggedIn" v-on:click.prevent="logout" href="/logout">Logout</a>
      </div>
      
    </div>
    <router-view v-on:loginUpdated="setLoggedIn"/>
    <div class="App"></div>
  </div>
</template>
<script>
import auth from './auth'
import gmapsInit from './utils/gmaps'

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
  data() {
    return {
      loggedIn: false
    }
  },
  methods: {
    logout() {
      this.loggedIn = false;
      auth.logout();
      fetch(`${process.env.VUE_APP_REMOTE_API}/logout`, {
        method: 'POST',
      })
    },
    setLoggedIn() {
      this.loggedIn = auth.loggedIn();
    }
  },
  created() {
    this.loggedIn = auth.loggedIn();
  }
 
}

</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Francois+One&display=swap');

#nav {

}

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

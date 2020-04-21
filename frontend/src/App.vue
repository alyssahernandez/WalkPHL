<template>
  <div id="app">
    <div id="nav">
      <router-link to="/">Home</router-link>
      <div>
        <router-link to="/login">Login</router-link>
        <a v-if="loggedIn" v-on:click.prevent="logout" href="/logout">Logout</a>
      </div>
      
    </div>
    <router-view v-on:loginUpdated="setLoggedIn"/>
  </div>
</template>

<script>
import auth from './auth'


export default {
  components: {
  },
  data() {
    return {
      loggedIn: false
    }
  },
  methods: {
    logout() {
      console.log("logging out");
      this.loggedIn = false;
      auth.logout();
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

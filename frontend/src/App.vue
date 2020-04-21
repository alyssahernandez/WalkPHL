<template>
  <div id="app">
    <div id="nav">
      <router-link to="/">Home</router-link>
      <div>
        <router-link v-if="!loggedIn" to="/login">Login</router-link>
        <router-link to="/logout">Logout</router-link>
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

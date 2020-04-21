<template>
  <div id="app">
    <div id="nav">
      <router-link to="/">Home</router-link>
      <router-link v-if="!loggedIn" to="/login">Login</router-link>
      <router-link v-if="loggedIn" to="/logout">Logout</router-link>
    </div>
    <router-view/>
  </div>
</template>

<script>
import auth from '../src/auth';

export default {
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

@media only screen and (max-width: 768px) {
    #app {
       
    }

}

@media only screen and (min-width: 768px) {
    #app {
        
    }
}
</style>

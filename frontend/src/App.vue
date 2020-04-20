<template>
  <div id="app">
    <div id="nav">
      <router-link to="/">Home</router-link>
      <div v-if= "token === null">
        <router-link to="/login">Login</router-link>
      </div>
    
    </div>
    <router-view/>
  </div>
</template>

<script>
import auth from '../auth';

export default {
  
}
</script>
#app {
  width: 100vw;
  height: 100vh;
}
<style>

</style>

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
//import auth from '../auth';

export default {
  
}
</script>
#app {
  width: 100vw;
  height: 100vh;
}
<style>
@media only screen and (max-width: 768px) {
  #app {
    background-color: red;
  }
}

@media only screen and (min-width: 768px) {
  #app {
    background-color: blue;
  }
}
</style>

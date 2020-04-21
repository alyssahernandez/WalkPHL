<template>
  <div id="app">
    <div id="nav">
      <router-link to="/">Home</router-link>
      <router-link to="/login">Login</router-link> 
    </div
    <router-view/>
  </div>
</template>

<script>

export default {

  
}


</script>

<style>
#app {
  width: 100vw;
  height: 100vh;
}

@media only screen and (max-width: 768px) {
    #app {
        background-color: blue;
    }
    img { 
        display: none;
    }
}

@media only screen and (min-width: 768px) {
    #app {
        background-color: red;
    }
}
</style>

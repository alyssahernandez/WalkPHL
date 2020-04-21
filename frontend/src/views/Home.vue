<template>
  <div class="home">
    
    <div class="hi"></div>
    <button class="button is-rounded blue-green-gradient-vertical">Start </button>
    
    <h1 class="app-title">WalkPHL</h1>
    <p>You must be authenticated to see this</p>
  </div>
</template>

<script>

export default {
  name: 'Home',
  
  }
</script>

<style scoped>



.app-title {
  font-family: 'Francois One', sans-serif;
  color: #03b6fc;
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
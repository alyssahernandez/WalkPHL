<template>
  <div class="home">
    <h1>Home</h1>
    <p>You must be authenticated to see this</p>
  </div>
</template>

<script>
export default {
  name: 'home'
}
</script>

<style scoped>
.home {

}

@media only screen and (max-width: 768px) {
    .home {
        background-color: blue;
    }
    img { 
        display: none;
    }
}

@media only screen and (min-width: 768px) {
    .home {
        background-color: red;
    }
}
</style>
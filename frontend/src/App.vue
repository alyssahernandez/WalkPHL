<template>
  <div id="app">
    <div id="nav">
      <router-link to="/">Home</router-link>
      <router-link v-if="authenticated" to="/login">Login</router-link>
    </div>
    <router-view/>
  </div>
</template>

<script>
export default {
  
}
</script>

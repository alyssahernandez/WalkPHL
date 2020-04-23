<template>
  <div class="contanier profile">
      <h1>{{username}}</h1>
  </div>
</template>


<script>
export default {
  data() {
    return {
      username: null
    }
  },
  methods: {
    User() {
      fetch()
    }
  }
}
</script>
  

<style>
  .profile {
    height: 100vh;
  padding: 0;
  display: flex;
  flex-wrap: nowrap;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  z-index: 9;
  }

</style>
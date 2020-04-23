<template>
  <div class="contanier profile">
      <h1>{{user}}</h1>
  </div>
</template>


<script>
import auth from '../auth';
export default {
  data() {
    return {
      username: null,
      user: null
    }
  },
  methods: {
    User(username) {
      fetch(`${process.env.VUE_APP_REMOTE_API}/profile/` + username, {
        method: 'GET',
        header: {
          Authorization: 'Bearer ' + auth.getToken()
        }
      })
      .then((response) => {
        return response.json;
      })
      .catch(err => console.log(err))
    }
  },
  created() {
    this.username = this.$route.params.username;

    this.user = this.User(this.username);
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
<template>
  <div class="contanier profile">
      <h1>{{user.user.username}}</h1>
      <img v-for="badge in user.userBadges" :key="badge.badgeId" :src="require(`../assets/images/${badge.imgUrl}`)" alt="pictures">
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
        headers: {
          Authorization: 'Bearer ' + auth.getToken(),
        }
      })
      .then((response) => {
        if(response.ok) {
          console.log(response);
          return response.json();
        }
      })
      .then((user) => {
        this.user = user;
        console.log(user);
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
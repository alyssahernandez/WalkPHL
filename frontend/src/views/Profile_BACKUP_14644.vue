<template>
  <div class="contanier profile">
<<<<<<< HEAD
      <h1>{{user.user.username}}</h1>
      <h1>{{user}}</h1>
=======
      <h1>{{user.username}}</h1>
      <h1>{{user}}</h1>
      <h1>{{directions}}</h1>
>>>>>>> b76c5dfb9a39b97f12d6bc76ef3db4c4c4d86e91
  </div>
</template>

<script>
import auth from '../auth';
export default {
  data() {
    return {
      username: null,
      user: null,
      directions: null
    }
  },
  methods: {
    User() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/profile/` + this.username, {
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
    },
    getDirections() {
      fetch('https://maps.googleapis.com/maps/api/directions/json?origin=Brooklyn&destination=Queens&mode=walking&key=AIzaSyCsnAc4fR8Sd-AqYRNkEhaH434Lm9r8trI', {
        method: 'GET',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
        }
      })
      .then((response) => {
        if(response.ok) {
          console.log(response);
          return response.json();
        }
      })
      .then((directions) => {
        this.directions = directions;
        console.log(directions);
      })
      .catch(err => console.log(err))
    },
  },
  created() {
    this.username = this.$route.params.username;
    this.user = this.User();
    this.directions = this.getDirections();
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
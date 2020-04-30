<template>
  <div id="app" class="location-request">
    <form class="location-request" @submit.prevent="addRequest">
      <p>
        <strong class="request-header">Recommend a destination!</strong>
      </p>
      
        <input
          type="text"
          v-model="destination.name"
          placeholder="Name"
          id="name"
          class="input"
          maxlength="30"
          required
          autofocus
        />
        <br>
      <button class="button is-rounded is-primary" type="submit">Submit Location</button>
    </form>
  </div>
</template>

<script>
import auth from "../auth";
export default {
  name: "locationrequest",
  components: {},
  data() {
    return {
      destination: {
        name: ""
      },
    };
  },
  computed: {
    userLoggedIn() {
      return auth.getToken() != null;
    }
  },
  methods: {
    addRequest() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/api/location-submit`, {
        method: "POST",
        headers: {
          Authorization: "Bearer " + auth.getToken(),
          Accept: "application/json",
          "Content-Type": "application/json"
        },
        body: JSON.stringify(this.destination)
      })
        .then(response => {
          if (response.ok) {
            this.$router.push({ path: "/" });
            console.log("success! destination added");
          } else {
            console.log("error adding destination");
          }
        })
        .then(err => console.log(err));
    }
  }, 
  created() {
    this.user = auth.getUser().sub;
  }
};
</script>

<style>

.location-request {
  height: 100vh;
  padding: 0;
  display: flex;
  flex-wrap: nowrap;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  z-index: 9;
}

.request-header {
    font-family: 'Francois One', sans-serif;
    color: #03b6fc;
    font-size: 3em;
    text-align: center;
  }



</style>
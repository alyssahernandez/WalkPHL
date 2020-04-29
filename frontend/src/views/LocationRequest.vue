<template>
  <div id="app" class="location-request">
    <form @submit.prevent="addRequest">
      <p>
        <strong>Recommend a destination!</strong>
      </p>
      <label for="name">
        Name
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
      </label>

      <button class="button" type="submit">Submit Location</button>
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
            this.$router.push({ path: "/locationrequest" });
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
</style>
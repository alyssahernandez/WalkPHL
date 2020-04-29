<template>
  <div id="app" class="location-request">
    <form @submit.prevent="addDestination">
      <p>
        <strong>Add a destination</strong>
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
      <label for="description">
        Name
        <input
          type="text"
          v-model="destination.description"
          placeholder="description"
          id="description"
          class="input"
          maxlength="30"
          required
          autofocus
        />
      </label>
      <label for="latitude">
        Latitude
        <input
          type="text"
          v-model="destination.latitude"
          placeholder="Latitude"
          id="latitude"
          class="input"
          maxlength="30"
          required
          autofocus
        />
      </label>
      <label for="longitude">
        Longitude
        <input
          type="text"
          v-model="destination.longitude"
          placeholder="longitude"
          id="longitude"
          class="input"
          maxlength="30"
          required
          autofocus
        />
      </label>
      <label for="city">
        City
        <input
          type="text"
          v-model="destination.city"
          placeholder="Philadelphia"
          id="city"
          class="input"
          maxlength="30"
          required
          autofocus
        />
      </label>
      <label for="state">
        State
        <input
          type="text"
          v-model="destination.state"
          placeholder="PA"
          id="state"
          class="input"
          maxlength="30"
          required
          autofocus
        />
      </label>
      <label for="zip_code">
        Zipcode
        <input
          type="text"
          v-model="destination.zip_code"
          placeholder="19103"
          id="zip_code"
          class="input"
          maxlength="30"
          required
          autofocus
        />
      </label>
      <label for="openFrom">
        OpenFrom time
        <input
          type="text"
          v-model="destination.openFrom"
          placeholder="0000"
          id="openFrom"
          class="input"
          maxlength="30"
          required
          autofocus
        />
      </label>
      <label for="openTo">
        OpenTo time
        <input
          type="text"
          v-model="destination.openTo"
          placeholder="0000"
          id="openTo"
          class="input"
          maxlength="30"
          required
          autofocus
        />
      </label>
      <label for="category">
        Category
        <input
          type="text"
          v-model="destination.category"
          placeholder="category"
          id="category"
          class="input"
          maxlength="30"
          required
          autofocus
        />
      </label>
      <label for="openOnWeekends">
        Open weekends? True/False
       
        <select id= "openOnWeekends" v-model="destination.openOnWeekends">
          <option value="true">True</option>
          <option value="false">False</option>
        </select>
      </label>

      <button class="button" type="submit">Submit Location</button>
    </form>
  </div>
</template>

<script>
import auth from "../auth";
export default {
  name: "adminfeatures",
  components: {},
  data() {
    return {
      destination: {
        name: "",
        description: "",
        latitude: "",
        longitude: "",
        city: "",
        state: "",
        zip_code: "",
        openFrom: "",
        openTo: "",
        openOnWeekends: "",
        category: "",
        imgUrl: "art.png"
      },
    };
  },
  computed: {
    userLoggedIn() {
      return auth.getToken() != null;
    }
  },
  methods: {
    addDestination() {
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
  }
};
</script>

<style>
</style>
<template>
  <div id="app" class="admin-features">
    <form @submit.prevent="addDestination">
      <h1 class="add-header">
        Add a destination
      </h1>
      <label for="name">
        Name
        <input
          type="text"
          v-model="destination.name"
          placeholder="Name"
          id="name"
          class="input"
          maxlength="128"
          required
          autofocus
        />
      </label>
      <label for="description">
        Description
        <input
          type="text"
          v-model="destination.description"
          placeholder="description"
          id="description"
          class="input"
          maxlength="255"
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
          maxlength="128"
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
          maxlength="128"
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
          maxlength="64"
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
          maxlength="32"
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
          maxlength="16"
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
          maxlength="32"
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
          maxlength="32"
          required
          autofocus
        />
      </label>
      <label for="category">
        Category
        <select id= "category" v-model="destination.category">
          <option value="Sights">Sights</option>
          <option value="Parks">Parks</option>
          <option value="Arts">Arts</option>
          <option value="Historical">Historical</option>
          <option value="Food">Food</option>
        </select>
      </label>
      <br>
      <label for="openOnWeekends">
        Open weekends?
        <select id= "openOnWeekends" v-model="destination.openOnWeekends">
          <option value="Yes">Yes</option>
          <option value="No">No</option>
        </select>
      </label>
      <br>
      <label for="wiki">
        Wikipedia Link
        <input
          type="text"
          v-model="destination.wiki"
          placeholder="wiki"
          id="wiki"
          class="input"
          maxlength="255"
          autofocus
        />
      </label>
      <label for="twitterHandle">
        Twitter Handle
        <input
          type="text"
          v-model="destination.twitterHandle"
          placeholder="twitterHandle"
          id="wiki"
          class="input"
          maxlength="128"
          autofocus
        />
      </label>

      <br>
      <button class="button is-primary" type="submit">Submit Destination</button>
    </form>
    <br>
    <br>
    <h1 class="add-header"> 
      Current Requests:
    </h1>

    <div class="user-requests">
     <div class="container">
          <div class="box" v-for="request in requests" :key="request.name">
            <div class="content">
                  <p>
                    <strong>Location: </strong> {{request.name}}
                    <br />
                    <br />
                    <strong>Requested by: </strong> {{request.username}}
                    <br />
                  </p>
                </div>
          </div>
    </div>
      </div>

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
        imgUrl: "park.jpg",
        iconUrl: "arts.jpg",
        wiki: "",
        twitterHandle: "",
      },
      request: {
        name: "",
        username: "",
      },
      requests: null,
    };
  },
  computed: {
    userLoggedIn() {
      return auth.getToken() != null;
    }
  },
  methods: {
    addDestination() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/api/admin-submit`, {
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
    },
    getRequests() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/user-requests`, {
        method: "GET",
        headers: {
          Authorization: "Bearer " + auth.getToken(),
          Accept: "application/json",
          "Content-Type": "application/json"
        }
      })
        .then(response => {
          if (response.ok) {
            console.log(response);
            return response.json();
          }
        })
        .then(requests => {
          console.log(requests);
          this.requests = requests;
        })
        .catch(err => {
          console.log(err);
        });
    },
  },
  created() {
    this.requests = this.getRequests();
  },
};
</script>

<style>

.add-header {
    font-family: 'Francois One', sans-serif;
    color: #03b6fc;
    font-size: 2em;
    text-align: center;
  }

</style>
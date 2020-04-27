<template>
    <div id="app" class="admin-features">
      <form>
                <p><strong>Add a destination</strong></p>
                <label for="latitude">
                  Latitude
                  <input 
                    type="text"
                    v-model="addDestination.latitude"
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
                    v-model="addDestination.longitude"
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
                    v-model="addDestination.city"
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
                    v-model="addDestination.state"
                    placeholder="PA"
                    id="state"
                    class="input"
                    maxlength="30"
                    required
                    autofocus
                  />
                </label>
                <label for="zipcode">
                 Zipcode
                  <input 
                    type="text"
                    v-model="addDestination.zipcode"
                    placeholder="19103"
                    id="zipcode"
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
                    v-model="addDestination.openFrom"
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
                    v-model="addDestination.openTo"
                    placeholder="0000"
                    id="openTo"
                    class="input"
                    maxlength="30"
                    required
                    autofocus
                  />
                </label>
                <label for="weekends">
                 Open weekends? True/False
                  <input 
                    type="text"
                    v-model="addDestination.weekends"
                    placeholder="True"
                    id="weekends"
                    class="input"
                    maxlength="100"
                    required
                    autofocus
                  />
                </label>
                <button class="button" type="submit">Submit Location</button>
              </form>
    </div>

</template>

<script>
import auth from '../auth';
export default {
    name: 'admin-features',
    components: {
      
    },
    data() {
      return {
          addDestination: {
              latitude: '',
              longitude: '',
              city: '',
              state: '',
              zipcode: '',
              openFrom: '',
              openTo: '',
              weekends: ''

          },
    computed: {
      userLoggedIn() {
        return (auth.getToken() != null);
      }
      }}}};
</script>

<style>

</style>
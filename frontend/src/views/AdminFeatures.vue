<template>
    <div id="app" class="admin-features">
      <h1> test </h1>

      <form>
                <p><strong>Add a location?</strong></p>
                <label for="location">
                  <input 
                    type="text"
                    v-model="addDestination.location"
                    placeholder="Location"
                    id="location"
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
              location: '',
              testOption: 'Option',

          },
    computed: {
      userLoggedIn() {
        return (auth.getToken() != null);
      }
      }}}};
</script>

<style>

</style>
<template>
    <div id="app" class="admin-features">
      <h1> test </h1>
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
          menuOptions: {
              addLocation: 'Add Location',
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
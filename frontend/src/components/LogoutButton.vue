<template>
    <div>
        <form @submit.prevent="logoutUser">
            <div class="alert alert-success" role="alert" v-if="this.$route.query.message">
            Thank you for registering, please sign in.
            </div>
            <button type="submit">Sign Out</button>
        </form>
    </div>
</template>

<script>
import auth from '../auth';

export default {
    name: 'logout-button',
    data() {

    },
    methods: {
      logoutUser() {
        fetch(`${process.env.VUE_APP_REMOTE_API}/logout`, {
          method: 'POST',
          headers: {
            Accept: 'application/json',
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(auth.getUser),
        })
          .then((response) => {
            if (response.ok) {
              console.log(response);
              auth.logout();
              auth.logout;
              this.$router.push({ path: '/login', query: { message: 'success' } });
            }
            else
            {
              console.log("FUCKKKKL");
            }
          })
          .then((err) => console.error(err));
      }
  }
}
</script>
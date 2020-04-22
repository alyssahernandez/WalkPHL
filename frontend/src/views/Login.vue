<template>
  <div>
    <form class="login-form" @submit.prevent="login">
    <h1>Please Sign In</h1>
      <div class="field">
        <div class="help is-danger" role="alert" v-if="invalidCredentials">
          Invalid username and password!
        </div>
        <div class="alert alert-success" role="alert" v-if="this.$route.query.registration">
          Thank you for registering, please sign in.
        </div>
        <label for="username" class="label">Username</label>
        <div class="control has-icons-left has-icons-right">
          <input
            type="text"
            id="username"
            class="input form-control"
            placeholder="Username"
            v-model="user.username"
            required
            autofocus
          />
          <span class="icon is-small is-left">
            <i class="fas fa-user"></i>
          </span>
          <span class="icon is-small is-right">
            <i class="fas fa-check"></i>
          </span>
        </div>
        <div class="control has-icons-left has-icons-right">
        <label for="password" class="label">Password</label>
          <input
            type="password"
            id="password"
            class="input form-control"
            placeholder="Password"
            v-model="user.password"
            required
          />
          <span class="icon is-small is-left">
            <i class="fas fa-user"></i>
          </span>
            <span class="icon is-small is-right">
            <i class="fas fa-check"></i>
          </span>
        </div>
        <router-link class="need-account-link" :to="{ name: 'register' }">Need an account?</router-link>
          <div class="control">
           <button class="button" type="submit">Submit</button>
          </div>
      </div>
    </form>
  </div>
</template>

<script>
import auth from '../auth';

export default {
  name: 'login',
  components: {},
  data() {
    return {
      user: {
        username: '',
        password: '',
      },
      invalidCredentials: false,
    };
  },
  methods: {
    login() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/login`, {
        method: 'POST',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(this.user),
      })
        .then((response) => {
          if (response.ok) {
            return response.text();
          } else {
            this.invalidCredentials = true;
          }
        })
        .then((token) => {
          if (token != undefined) {
            if (token.includes('"')) {
              token = token.replace(/"/g, '');
            }
            auth.saveToken(token);
            this.$emit('loginUpdated');
            this.$router.push({name: 'home'});
          }
        })
        .catch((err) => console.error(err));
    },
  },
};
</script>

<style scoped>
.login-form {
  z-index: 11;
  position: fixed;
  margin-top: 5em;
  display: flex;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-content: center; 
}

.need-account-link {
  color: black;
}
</style>

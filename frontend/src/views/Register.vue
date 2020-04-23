<template>
  <div>
    <form class="form-register registration-form" @submit.prevent="register">
      <h1>Create Account</h1>
        <div class="field">
        <div class="alert is-danger" role="alert" v-if="registrationErrors">
          There were problems registering this user.
        </div>
        
        <label for="username" class="label">Username</label>
        <div class="control has-icos-left has-icons-right">
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
        <label for="password" class="sr-only">Password</label>
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
          <input
            type="password"
            id="confirmPassword"
            class="input form-control"
            placeholder="Confirm Password"
            v-model="user.confirmPassword"
            required
          />
          <span class="icon is-small is-left">
              <i class="fas fa-user"></i>
            </span>
              <span class="icon is-small is-right">
              <i class="fas fa-check"></i>
            </span>
        </div>
        <router-link class="have-account-link" :to="{ name: 'login' }">
          Have an account?
        </router-link>
        <div class="control">
          <button class="button" type="submit">Create Account</button>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
    };
  },
  methods: {
    register() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/register`, {
        method: 'POST',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(this.user),
      })
        .then((response) => {
          if (response.ok) {
            this.$router.push({ path: '/login', query: { registration: 'success' } });
          } else {
            this.registrationErrors = true;
          }
        })

        .then((err) => console.error(err));
    },
  },
};
</script>

<style scoped>

.registration-form {
  z-index: 11;
  position: fixed;
  margin-top: 5em;
  display: flex;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-content: center; 
}

.have-account-link {
  color: black;
}


</style>

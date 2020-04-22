<template>
  <div id="app">
    <nav class="level nav-menu-background">
      <span class="level-item has-text-centered">
        
      </span>
      <span class="level-item has-text-centered">
        
      </span>
      <h1 class="app-title-white level-item has-text-centered">
        <router-link to="/">WalkPHL</router-link>
      </h1>
      <span class="level-item has-text-centered">
        
      </span>
      <span class="level-item has-text-centered">
        <router-link v-if="!loggedIn" to="/login">Sign In</router-link>
                <a v-if="loggedIn" v-on:click.prevent="logout" href="/logout">Logout</a>  
      </span>
    </nav>

    <!--
      <nav class="navbar level" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
          <h1 class="level-item has-text-centered">WalkPHL</h1>
        </div>
        <div class="navbar-menu">
          <div class="navbar-end">
            <div class="navbar-item">
              <router-link v-if="!loggedIn" to="/login">Sign In</router-link>
                <a v-if="loggedIn" v-on:click.prevent="logout" href="/logout">Logout</a>            
            </div>
          </div>
        </div>
      </nav>
    -->

    <!--
    <div id="nav">
      <router-link to="/">Home</router-link>
      <div>
        <router-link v-if="!loggedIn" to="/login">Login</router-link>
        <a v-if="loggedIn" v-on:click.prevent="logout" href="/logout">Logout</a>
      </div>
    </div>
    -->
    <router-view v-on:loginUpdated="setLoggedIn" />
  </div>
</template>


<script>
import auth from './auth';

export default {
  name: 'App',
  components: {
    
  },
  data() {
    return {
      loggedIn: false
    };
  },
  methods: {
    logout() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/logout`, {
        method: 'POST',
        headers: {
          Authorization: 'Bearer ' + auth.getToken()
        }
      })
      .then(response => {
        if(response.ok) {
          auth.logout();
          this.loggedIn = false;
        }
      })
    },
    setLoggedIn() {
      this.loggedIn = auth.loggedIn();
    }
  },
  created() {
    this.loggedIn = auth.loggedIn();

    document.addEventListener("DOMContentLoaded", () => {
      // Get all "navbar-burger" elements
      const $navbarBurgers = Array.prototype.slice.call(
        document.querySelectorAll(".navbar-burger"),
        0
      );

      // Check if there are any navbar burgers
      if ($navbarBurgers.length > 0) {
        // Add a click event on each of them
        $navbarBurgers.forEach(el => {
          el.addEventListener("click", () => {
            // Get the target from the "data-target" attribute
            const target = el.dataset.target;
            const $target = document.getElementById(target);

            // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
            el.classList.toggle("is-active");
            $target.classList.toggle("is-active");
          });
        });
      }
    });
  }
};
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Francois+One&display=swap");

#nav {
}

#app {
  width: 100vw;
  height: 100vh;
}

@media only screen and (max-width: 768px) {
  #app {
  }
}

@media only screen and (min-width: 768px) {
  #app {
  }
}

.App {
  width: 100px;
  height: 100px;
}

</style>

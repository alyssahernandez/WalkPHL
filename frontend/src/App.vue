<template>
  <div id="app">

    
    <nav class="navbar nav-shadow" role="navigation" aria-label="main navigation">
      <div class="navbar-brand">
          <h1 class="app-title-white navbar-item has-text-centered">
            <a class="walk-phl-nav blue-nav-item" href="/">WalkPHL</a>
          </h1>
        <a role="button" class="navbar-burger burger { is Active }" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>  
        </a>
      </div>
      
      <div class="navbar-menu">
        
        
          
        <router-link class="navbar-item" :to="{name: 'about'}">
          About
        </router-link>
        <router-link class="navbar-item" :to="{name: 'badges'}">
          Badges
        </router-link>
        <router-link class="navbar-item" :to="{name: 'review'}">
          Reviews
        </router-link>
        <hr class="navbar-divider">
        <router-link class="navbar-item" v-if="loggedIn && userRole == 'City Administrator'" :to="{name: 'adminfeatures'}">
          Admin Features
        </router-link>
        <router-link class="navbar-item" v-if="loggedIn && userRole == 'City Visitor'" :to="{name: 'locationrequest'}">
         Location Request
        </router-link>

        
        <div class="navbar-end">
          <div class="navbar-item">
            <div class="navbar-item has-dropdown is-hoverable" v-if="loggedIn">
              <router-link class="navbar-item blue-nav-item" :to="{name:'profile', params:{username: user}}"><b>{{user}}</b></router-link>
            </div>
            <router-link class="navbar-item" v-if="!loggedIn" :to="{name:'login'}">Sign In</router-link>
            <a class="navbar-item" v-if="loggedIn" v-on:click.prevent="logout" href="/logout">Logout</a>
          </div>
        </div>
      </div>
    </nav>



<!--    <router-link v-bind:login="this.loggedIn" :to="{path: '/'}"></router-link>   // Why can't we bind shit to the home view?! -->
 

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
      loggedIn: false,
      user: "",
      userRole: "",
    }
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
          this.user = "";
          this.$router.push({name: 'home'});
        }
      })
    },
    setLoggedIn() {
      this.loggedIn = auth.loggedIn();
      this.user = auth.getUser().sub;
      this.userRole = auth.getUser().rol;
    },
  },
  created() {    
      this.loggedIn = auth.loggedIn();
      this.user = auth.getUser().sub;
      this.userRole = auth.getUser().rol;
  }
};

document.addEventListener('DOMContentLoaded', () => {

  // Get all "navbar-burger" elements
  const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

  // Check if there are any navbar burgers
  if ($navbarBurgers.length > 0) {

    // Add a click event on each of them
    $navbarBurgers.forEach( el => {
      el.addEventListener('click', () => {

        // Get the target from the "data-target" attribute
        const target = el.dataset.target;
        const $target = document.getElementById(target);

        // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
        el.classList.toggle('is-active');
        $target.classList.toggle('is-active');

      });
    });
  }

});
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Francois+One&display=swap");
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap');

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
  width: 100vh;
  height: 100vh;
}

.div-title {
  font-family: 'Nanum Gothic', sans-serif;
  font-weight: bold;
}

.nav-shadow {
  box-shadow: 0px 2px 5px 1px #c7c7c7;
}

.space-below-input {
  margin-top: 2rem;
}

</style>

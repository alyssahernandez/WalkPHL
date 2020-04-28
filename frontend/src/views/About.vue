<template>
  <div>
    <div class="container content is-large">
        <h1>We are WalkPHL</h1>
        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, 
            nec rutrum justo nibh eu lectus. 
            Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque.
        </p>
    </div>
    <br>
    <section class="hero is-primary">
        <div class="hero-body">
            <div class="container">
                <h1 class="title">
                    Earn Badges!
                </h1>
                <div class="container content is-medium">
                    <p> 
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, 
                        nec rutrum justo nibh eu lectus. 
                        Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque.
                    </p>
                </div>
            </div>
        </div>
    </section>
    <section class="hero is-primary">
        <div class="hero-body">
            <div class="container">
                <h1 class="title">
                    Get Directions
                </h1>
                <div class="container content is-medium">
                    <p> 
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, 
                        nec rutrum justo nibh eu lectus. 
                        Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque.
                    </p>
                </div>
            </div>
        </div>
    </section>
    <section class="hero is-primary">
        <div class="hero-body">
            <div class="container">
                <h1 class="title">
                    Write a Review
                </h1>
                <div class="container content is-medium">
                    <p> 
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, 
                        nec rutrum justo nibh eu lectus. 
                        Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque.
                    </p>
                </div>
                <br>
                <router-link :to="{name: 'login'}" class="button" tag="button" v-if="notSignedIn">
                    Get Started!
                </router-link>
            </div>
        </div>
    </section>
  </div>
</template>

<script>
import auth from '../auth'

export default {
   data() {
       return {
        notSignedIn: true
       }
   },
   methods: {
       
       isSignedIn() {
           if(auth.getToken()) {
               this.notSignedIn = false;
           } else {
               this.notSignedIn = true;
           }
       }
   },
   created() {
       this.notSignedIn = this.isSignedIn();
   }
   
}

</script>

<style>

</style>
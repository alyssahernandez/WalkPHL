<template>
  <div>
    <div class="container content is-large">
        <h1>We are WalkPHL</h1>
        <p>
            Our goal is to help you, the intrepid city slicker, find everything that Philadelphia has to offer. From the cornucopia of local and international cuisines to the history of the nation's dawn, the city is brimming with opportunities for leisurely exploration.  We've found the spots; your next journey is a click away. What are you waiting for?
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
                        Upon checking in select locations, you'll receive an badge on your profile! By visiting the One Liberty Observation Deck, for example, you'll receive the Sky Badge — a WalkPHL favorite. We don't just give these things away, so we'll let you find the rest &#128521;. 
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
                        Effortlessly find popular tourist attractions near you.  We'll fill this out tonight, LeeAnn. Oh, and we have a RADIUS FINDER 3000!
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
                       If you had a particularly enjoyable time at one of our curated destinations, we encourage you to leave a review! Philadelphia is visted by millions of individuals annually. Your feedback could be the reason that someone has an amazing adventure that they may not have otherwise had! 
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
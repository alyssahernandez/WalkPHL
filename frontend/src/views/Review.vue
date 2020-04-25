<template>
  <div class="container">
    <h3>Reviews for {{reviews}}</h3>
  </div>
</template>

<script>
import auth from '../auth';
    
export default {
  name: 'review',
  data() {
    return {
      reviews: null
    }
  },
  methods: {
    getReviews() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/reviews`, {
        method: 'GET',
        headers: {
          Authorization: 'Bearer ' + auth.getToken()
        }
      })
      .then((response) => {
        if(response.ok) {
          console.log(response);
          return response.json();
        }
      })
      .then((reviews) => {
        console.log(reviews);
        this.reviews = reviews;
      })
      .catch(err => {console.log(err)})
    }
  },
  created(){
   this.reviews = this.getReviews();
  }

}
</script>

<style>

</style>
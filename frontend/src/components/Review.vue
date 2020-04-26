<template>
  <div class="container">
    <div class="box" v-for="review in reviews" :key="review.review_id">
  <article class="media">
    <div class="media-left">
      <figure class="image is-64x64">
        <img src="https://bulma.io/images/placeholders/128x128.png" alt="Image">
      </figure>
    </div>
    <div class="media-content">
      <div class="content">
        <p>
          <strong>{{review.username}}</strong>
          <br>
          <br>
         <strong>{{review.title}}</strong>
          <br>
          {{review.review}}
        </p>
      </div>
      <nav class="level is-mobile">
        <div class="level-left">
          <p class="level-item">
            <span>
              {{review.review_date}}
            </span>
          </p>
        </div>
      </nav>
    </div>
  </article>
</div>
  </div>
</template>

<script>
import auth from '../auth';
    
export default {
  name: 'review-fuck',
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
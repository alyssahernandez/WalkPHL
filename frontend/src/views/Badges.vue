<template>
  <div>
    <div class="card" v-for="badge in badges" :key="badge.badgeId">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-128x128">
              <img :src="require(`../assets/images/${badge.imgUrl}`)" alt="pictures" >
            </figure>
          </div>
          <div class="media-content">
          <p class="title is-4">{{badge.name}}</p>
          <p class="subtitle is-6">Location</p>
            <div class="content">
              {{badge.description}}
              <br>
            </div>
          </div>
        </div>
    </div>
    </div>
  </div>
</template>
<!--C:\Users\Student\workspace\java-final-capstone-team-2\frontend\src\assets\images\Art.png-->
<script>
import auth from '../auth';
    
export default {
  name: 'badges',
  data() {
    return {
      badges: null
    }
  },
  methods: {
    getBadges() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/badges`, {
        method: 'GET',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
          Authorization: 'Bearer ' + auth.getToken()
        }
      })
      .then((response) => {
        if(response.ok) {
          console.log(response);
          return response.json();
        }
      })
      .then((badges) => {
        this.badges = badges;
        console.log(badges);
      })
      .catch(err => {console.log(err)})
    }
  },
  created(){
   this.badges = this.getBadges();
   
  }
}
</script>

<style >

</style>
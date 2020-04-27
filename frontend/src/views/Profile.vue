<template>
  <div class="contanier profile">
    <div class="columns">
  <div class="container profile">
    <div class="modal" id="edit-preferences-modal">
      <div class="modal-background"></div>
      <div class="modal-card">
        <header class="modal-card-head">
          <p class="modal-card-title">Edit Preferences</p>
          <button v-on:click="editPreferences" class="delete"></button>
        </header>
        <section class="modal-card-body">
          <label class="label">Description</label>
          <p class="control">
            <textarea class="textarea" placeholder="Describe Yourself!"></textarea>
          </p>
        </section>
        <footer class="modal-card-foot">
          <a v-on:click="editPreferences" class="button is-primary modal-save">Save changes</a>
          <a v-on:click="editPreferences" class="button modal-cancel">Cancel</a>
        </footer>
      </div>
    </div>
    <div class="section profile-heading">
      <div class="columns is-mobile is-multiline">
        <div class="column is-2">
          <span class="header-icon user-profile-image">
            <img :src="require(`../assets/images/${user.user.profilePicture}`)" alt="Profile Picture">
          </span>
        </div>
        <!-- Start of user profile -->
        <div class="column is-4-tablet is-10-mobile name">
          <p>
            <span class="title is-bold">{{user.user.username}}</span>
            <br/>
            <a v-on:click="editPreferences" class="button is-primary is-outlined" href="#" id="edit-preferences" style="margin: 5px 0">
              Edit Preferences
            </a>
            <br/>
          </p>
          <p class="tagline">
            {{user.user.bio}}
          </p>
        </div>
        <div class="column is-2-tablet is-4-mobile has-text-centered">
          <p class="stat-val">{{badgeCount}}</p>
          <p class="stat-key">Badges</p>
        </div>
        <div class="column is-2-tablet is-4-mobile has-text-centered">
          <p class="stat-val">{{checkinCount}}</p>
          <p class="stat-key">Check-ins</p>
        </div>
        <div class="column is-2-tablet is-4-mobile has-text-centered">
          <p class="stat-val">{{reviewCount}}</p>
          <p class="stat-key">Reviews</p>
        </div>
      </div>
    </div>
    <div class="profile-options is-fullwidth">
      <div class="tabs is-fullwidth is-medium">
        <ul id="tabs">
          <li id="badge" class="link">
            <a v-on:click="displayBadges">
              <span class="icon">
                <i class="fa fa-list"></i>
              </span>
              <span>My Badges</span>
            </a>
          </li>
          <li id="checkIn" class="link">
            <a v-on:click="dispalyCheckIns">
              <span class="icon">
                <i class="fa fa-thumbs-up"></i>
              </span>
              <span>Check-Ins</span>
            </a>
          </li>
          <li id="review" class="link">
            <a v-on:click="displayReviews">
              <span class="icon">
                <i class="fa fa-thumbs-up"></i>
              </span>
              <span>My Reviews</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
    
      <!-- Main container
      -->
      
    <div class="columns is-mobile" v-if="badgesOn">
      <div class="column is-3-tablet is-6-mobile" v-for="badge in user.userBadges" :key="badge.badgeId">
        <div class="card">
          <div class="card-image">
            <figure class="image is-4by3">
              <img :src="require(`../assets/images/${badge.imgUrl}`)" alt="pictures">
            </figure>
          </div>
          <div class="card-content">
            <div class="content">
              <span class="tag is-dark subtitle">Badge #{{badge.badgeId}}</span>
              <br>
              <strong>{{badge.name}}</strong>
              <p>{{badge.description}}</p>
            </div>
          </div>
          <footer class="card-footer">
          </footer>
        </div>
        <br/>
      </div>
    </div>
<!-- Individual User Check-Ins -->
    <div class="columns is-mobile" v-if="checkInsOn">
      <div class="column is-3-tablet is-6-mobile" v-for="visits in user.visited" :key="visits.destinationId">
        <div class="card">
          <div class="card-image">
            <figure class="image is-4by3">
              <img :src="require(`../assets/images/${visits.imgUrl}`)" alt="pictures">
            </figure>
          </div>
          <div class="card-content">
            <div class="content">
              <span class="tag is-dark subtitle">{{visits.destinationId}}</span>
              <br>
              <strong>{{visits.name}}</strong>
              <p>{{visits.city}}</p>
            </div>
          </div>
          <footer class="card-footer">
          </footer>
        </div>
        <br/>
      </div>
    </div>
<!-- Individual User Reviews -->
    <div class="columns is-mobile" v-if="reviewsOn">
      <div class="column is-3-tablet is-6-mobile" v-for="review in user.reviews" :key="review.review_id">
        <div class="card">
          <div class="card-content">
            <div class="content">
              <span class="tag is-dark subtitle">{{review.review_id}}</span>
              <br>
              <strong>{{review.title}}</strong>
              <p>{{review.review}}</p>
            </div>
          </div>
          <footer class="card-footer">
            <p>{{review.review_date}}</p>
          </footer>
        </div>
        <br/>
      </div>
    </div>

  </div>
</div>
  </div>
</template> 

<script>
import auth from '../auth';

export default {
  data() {
    return {
      username: null,
      user: null,
      badgesOn: true,
      checkInsOn: false,
      reviewsOn: false
    }
  },
  methods: {
    User(username) {
      fetch(`${process.env.VUE_APP_REMOTE_API}/profile/` + username, {
        method: 'GET',
        headers: {
          Authorization: 'Bearer ' + auth.getToken(),
        }
      })
      .then((response) => {
        if(response.ok) {
          console.log(response);
          return response.json();
        }
      })
      .then((user) => {
        this.user = user;
        console.log(user);
      })
      .catch(err => console.log(err))
    },
    editPreferences() {
      let editPreferencesModal = document.getElementById("edit-preferences-modal");

      if(!editPreferencesModal.classList.contains('is-active')) {
        editPreferencesModal.classList.add('is-active');

      } else if(editPreferencesModal.classList.contains('is-active')) {
          editPreferencesModal.classList.remove('is-active');
      }  
    },
    displayBadges() {
      this.badgesOn = true;
      this.checkInsOn = false;
      this.reviewsOn = false;
      
    },
    dispalyCheckIns() {
      this.badgesOn = false;
      this.checkInsOn = true;
      this.reviewsOn = false;

    },
    displayReviews() {
      this.badgesOn = false;
      this.checkInsOn = false;
      this.reviewsOn = true;

    }
  },
  computed: {
    badgeCount() {
      return this.user.userBadges.length;
    },
    reviewCount() {
      return this.user.reviews.length;
    },
    checkinCount() {
      return this.user.visited.length;
    }
  },
  created() {
    this.username = this.$route.params.username;

    this.user = this.User(this.username);
  }
}
</script>
  

<style>
  body {
    background: #F5F7FA
  }
  
  .stat-val {
    font-size: 3em;
    padding-top: 20px;
    font-weight: bold;
  }
  
  .stat-key {
    font-size: 1.4em;
    font-weight: 200
  }
  
  .section.profile-heading .column.is-2-tablet.has-text-centered + .has-text-centered {
    border-left: 1px dotted rgba(0, 0, 0, .2);
  }
  
  .container.profile {
    margin-top: 1%;
  }
  
  .control.is-pulled-left span.select {
    margin-right: 5px;
    border-radius: 2px;
  }
  
  .modal-card .content h1 {
    padding: 40px 10px 10px;
    border-bottom: 1px solid #dadada
  }
  
  .container.profile .profile-options .tabs ul li.link a {
    margin-bottom: 20px;
    padding: 20px;
    background-color: #F1F1F1;
  }
</style>
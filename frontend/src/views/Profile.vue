<template>
  <div class="contanier profile">
    <div class="columns">
  <div class="container profile">
    <div class="modal" id="edit-preferences-modal" :on="preferences">
      <div class="modal-background"></div>
      <div class="modal-card">
        <header class="modal-card-head">
          <p class="modal-card-title">Edit Preferences</p>
          <button class="delete"></button>
        </header>
        <section class="modal-card-body">
          <label class="label">Name</label>
          <p class="control">
            <input class="input" placeholder="Text input" type="text">/
          </p>
          <label class="label">Username</label>
          <p class="control has-icon has-icon-right">
            <input class="input" placeholder="Text input" type="text" value="pmillerk">/
          </p>
          <label class="label">Email</label>
          <p class="control has-icon has-icon-right">
            <input class="input" placeholder="Email input" type="text" value="hello@">/
            <i class="fa fa-warning"></i>
            <span class="help is-danger">This email is invalid</span>
          </p>
          <div class="control">
            <div class="control-label is-pulled-left">
              <label class="label">Date of Birth</label>
            </div>
            <span>
              <span class="select">
                <select>
                  <option>Month</option>
                  <option>With options</option>
                </select>
              </span>
              <span class="select">
                <select>
                  <option>Day</option>
                  <option>With options</option>
                </select>
              </span>
              <span class="select">
                <select>
                  <option>Year</option>
                  <option>With options</option>
                </select>
              </span>
            </span>
          </div>
          <label class="label">Description</label>
          <p class="control">
            <textarea class="textarea" placeholder="Describe Yourself!"></textarea>
          </p>
          <div class="content">
            <h1>Optional Information</h1>
          </div>
          <label class="label">Phone Number</label>
          <p class="control has-icon has-icon-right">
            <input class="input" placeholder="Text input" type="text" value="+1 *** *** 0535">
          </p>
          <label class="label">Work</label>
          <p class="control has-icon has-icon-right">
            <input class="input" placeholder="Text input" type="text" value="Greater Washington Publishing">
          </p>
          <label class="label">School</label>
          <p class="control has-icon has-icon-right">
            <input class="input" placeholder="Text input" type="text" value="George Mason University">
          </p>
        </section>
        <footer class="modal-card-foot">
          <a class="button is-primary modal-save">Save changes</a>
          <a class="button modal-cancel">Cancel</a>
        </footer>
      </div>
    </div>
    <div class="section profile-heading">
      <div class="columns is-mobile is-multiline">
        <div class="column is-2">
          <span class="header-icon user-profile-image">
            <img src="http://placehold.it/300x225"/>
          </span>
        </div>
        <!-- Start of user profile -->
        <div class="column is-4-tablet is-10-mobile name">
          <p>
            <span class="title is-bold">{{user.user.username}}</span>
            <br/>
            <a class="button is-primary is-outlined" href="#" id="edit-preferences" style="margin: 5px 0">
              Edit Preferences
            </a>
            <br/>
          </p>
          <p class="tagline">
            {{user.user.bio}}
          </p>
        </div>
        <div class="column is-2-tablet is-4-mobile has-text-centered">
          <p class="stat-val">30</p>
          <p class="stat-key">Badges</p>
        </div>
        <div class="column is-2-tablet is-4-mobile has-text-centered">
          <p class="stat-val">10</p>
          <p class="stat-key">Check-ins</p>
        </div>
        <div class="column is-2-tablet is-4-mobile has-text-centered">
          <p class="stat-val">3</p>
          <p class="stat-key">Friends</p>
        </div>
      </div>
    </div>
    <div class="profile-options is-fullwidth">
      <div class="tabs is-fullwidth is-medium">
        <ul>
          <li class="link">
            <a>
              <span class="icon">
                <i class="fa fa-list"></i>
              </span>
              <span>My Badges</span>
            </a>
          </li>
          <li class="link is-active">
            <a>
              <span class="icon">
                <i class="fa fa-thumbs-up"></i>
              </span>
              <span>Check-Ins</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
    
      <!-- Main container
      -->
      
    <div class="columns is-mobile">
      <div class="column is-3-tablet is-6-mobile">
        <div class="card">
          <div class="card-image">
            <figure class="image is-4by3">
              <img src="http://placehold.it/300x225"/>
            </figure>
          </div>
          <div class="card-content">
            <div class="content">
              <span class="tag is-dark subtitle">#1</span>
              <p>Personal Notes on the Property (can be edited and saved automatically by clicking in and clicking out of text area) - 
                these are unique to the user - they will show up as part of a saved listings' info here - 
                but adding notes to a property does not automatically create a saved listing. 
                Likewise, removing this proeprty from saved listings does not auto remove the notes.</p>
            </div>
          </div>
          <footer class="card-footer">
            <a class="card-footer-item">Compare</a>
            <a class="card-footer-item">Share</a>
            <a class="card-footer-item">Delete</a>
          </footer>
        </div>
        <br/>
      </div>
      <div class="column is-3-tablet is-6-mobile">
        <div class="card">
          <div class="card-image">
            <figure class="image is-4by3">
              <img src="http://placehold.it/300x225"/>
            </figure>
          </div>
          <div class="card-content">
            <div class="content">
              <span class="tag is-dark subtitle">#2</span>
              <p>Personal Notes on the Property (can be edited and saved automatically by clicking in and clicking out of text area) - 
                these are unique to the user - they will show up as part of a saved listings' info here - 
                but adding notes to a property does not automatically create a saved listing. 
                Likewise, removing this proeprty from saved listings does not auto remove the notes.</p>
            </div>
          </div>
          <footer class="card-footer">
            <a class="card-footer-item">Compare</a>
            <a class="card-footer-item">Share</a>
            <a class="card-footer-item">Delete</a>
          </footer>
        </div>
        <br/>
      </div>
      <div class="column is-3">
        <div class="card">
          <div class="card-image">
            <figure class="image is-4by3">
              <img src="http://placehold.it/300x225"/>
            </figure>
          </div>
          <div class="card-content">
            <div class="content">
              <span class="tag is-dark subtitle">#3</span>
              <p>Personal Notes on the Property (can be edited and saved automatically by clicking in and clicking out of text area) - 
                these are unique to the user - they will show up as part of a saved listings' info here - 
                but adding notes to a property does not automatically create a saved listing. 
                Likewise, removing this proeprty from saved listings does not auto remove the notes.</p>
            </div>
          </div>
          <footer class="card-footer">
            <a class="card-footer-item">Compare</a>
            <a class="card-footer-item">Share</a>
            <a class="card-footer-item">Delete</a>
          </footer>
        </div>
        <br/>
      </div>
      <div class="column is-3">
        <div class="card">
          <div class="card-image">
            <figure class="image is-4by3">
              <img src="http://placehold.it/300x225"/>
            </figure>
          </div>
          <div class="card-content">
            <div class="content">
              <span class="tag is-dark subtitle">#4</span>
              <p>Personal Notes on the Property (can be edited and saved automatically by clicking in and clicking out of text area) - 
                these are unique to the user - they will show up as part of a saved listings' info here - 
                but adding notes to a property does not automatically create a saved listing. 
                Likewise, removing this proeprty from saved listings does not auto remove the notes.</p>
            </div>
          </div>
          <footer class="card-footer">
            <a class="card-footer-item">Compare</a>
            <a class="card-footer-item">Share</a>
            <a class="card-footer-item">Delete</a>
          </footer>
        </div>
        <br/>
      </div>
    </div>
    <div class="columns is-mobile">
      <div class="column is-3">
        <div class="card">
          <div class="card-image">
            <figure class="image is-4by3">
              <img src="http://placehold.it/300x225"/>
            </figure>
          </div>
          <div class="card-content">
            <div class="content">
              <span class="tag is-dark subtitle">#5</span>
              <p>Personal Notes on the Property (can be edited and saved automatically by clicking in and clicking out of text area) - 
                these are unique to the user - they will show up as part of a saved listings' info here - 
                but adding notes to a property does not automatically create a saved listing. 
                Likewise, removing this proeprty from saved listings does not auto remove the notes.</p>
            </div>
          </div>
          <footer class="card-footer">
            <a class="card-footer-item">Compare</a>
            <a class="card-footer-item">Share</a>
            <a class="card-footer-item">Delete</a>
          </footer>
        </div>
        <br/>
      </div>
      <div class="column is-3">
        <div class="card">
          <div class="card-image">
            <figure class="image is-4by3">
              <img src="http://placehold.it/300x225"/>
            </figure>
          </div>
          <div class="card-content">
            <div class="content">
              <span class="tag is-dark subtitle">#6</span>
              <p>Personal Notes on the Property (can be edited and saved automatically by clicking in and clicking out of text area) - 
                these are unique to the user - they will show up as part of a saved listings' info here - 
                but adding notes to a property does not automatically create a saved listing. 
                Likewise, removing this proeprty from saved listings does not auto remove the notes.</p>
            </div>
          </div>
          <footer class="card-footer">
            <a class="card-footer-item">Compare</a>
            <a class="card-footer-item">Share</a>
            <a class="card-footer-item">Delete</a>
          </footer>
        </div>
        <br/>
      </div>
      <div class="column is-3">
        <div class="card">
          <div class="card-image">
            <figure class="image is-4by3">
              <img src="http://placehold.it/300x225"/>
            </figure>
          </div>
          <div class="card-content">
            <div class="content">
              <span class="tag is-dark subtitle">#7</span>
              <p>Personal Notes on the Property (can be edited and saved automatically by clicking in and clicking out of text area) - 
                these are unique to the user - they will show up as part of a saved listings' info here - 
                but adding notes to a property does not automatically create a saved listing. 
                Likewise, removing this proeprty from saved listings does not auto remove the notes.</p>
            </div>
          </div>
          <footer class="card-footer">
            <a class="card-footer-item">Compare</a>
            <a class="card-footer-item">Share</a>
            <a class="card-footer-item">Delete</a>
          </footer>
        </div>
        <br/>
      </div>
      <div class="column is-3">
        <div class="card">
          <div class="card-image">
            <figure class="image is-4by3">
              <img src="http://placehold.it/300x225"/>
            </figure>
          </div>
          <div class="card-content">
            <div class="content">
              <span class="tag is-dark subtitle">#8</span>
              <p>Personal Notes on the Property (can be edited and saved automatically by clicking in and clicking out of text area) - 
                these are unique to the user - they will show up as part of a saved listings' info here - 
                but adding notes to a property does not automatically create a saved listing. 
                Likewise, removing this proeprty from saved listings does not auto remove the notes.</p>
            </div>
          </div>
          <footer class="card-footer">
            <a class="card-footer-item">Compare</a>
            <a class="card-footer-item">Share</a>
            <a class="card-footer-item">Delete</a>
          </footer>
        </div>
        <br/>
      </div>
    </div>
  </div>
</div>

      <img v-for="badge in user.userBadges" :key="badge.badgeId" :src="require(`../assets/images/${badge.imgUrl}`)" alt="pictures">
      <h1>{{user}}</h1>
  </div>
</template> 

<script>
import auth from '../auth';

export default {
  data() {
    return {
      username: null,
      user: null
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
    preferences() {
      let editPreferences = document.getElementById('edit-preferences');
      editPreferences.classList.add('is-active');
    }
  },
  created() {
    this.username = this.$route.params.username;

    this.user = this.User(this.username);
  }
}
/*
$(() => {
  $("#edit-preferences").click(function () {
    $("#edit-preferences-modal").addClass("is-active");
  });
  $(".modal-card-head button.delete, .modal-save, .modal-cancel").click(
    function () {
      $("#edit-preferences-modal").removeClass("is-active");
    }
  );
});
*/
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
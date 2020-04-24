<template>
    <div id="floating-panel">
      
      
      
      
      <img v-bind:src="'assets/images/' + this.badgeURL">
      
      
      
      
      
      
      
      
      
      
      
      
      
      <!--
      <strong>Start:</strong>
      <select id="start">
        <option value="chicago, il">Chicago</option>
        <option value="st louis, mo">St Louis</option>
        <option value="joplin, mo">Joplin, MO</option>
        <option value="oklahoma city, ok">Oklahoma City</option>
        <option value="amarillo, tx">Amarillo</option>
        <option value="gallup, nm">Gallup, NM</option>
        <option value="flagstaff, az">Flagstaff, AZ</option>
        <option value="winona, az">Winona</option>
        <option value="kingman, az">Kingman</option>
        <option value="barstow, ca">Barstow</option>
        <option value="san bernardino, ca">San Bernardino</option>
        <option value="los angeles, ca">Los Angeles</option>
      </select>
      <br>
      <strong>End:</strong>
      <select id="end">
        <option value="chicago, il">Chicago</option>
        <option value="st louis, mo">St Louis</option>
        <option value="joplin, mo">Joplin, MO</option>
        <option value="oklahoma city, ok">Oklahoma City</option>
        <option value="amarillo, tx">Amarillo</option>
        <option value="gallup, nm">Gallup, NM</option>
        <option value="flagstaff, az">Flagstaff, AZ</option>
        <option value="winona, az">Winona</option>
        <option value="kingman, az">Kingman</option>
        <option value="barstow, ca">Barstow</option>
        <option value="san bernardino, ca">San Bernardino</option>
        <option value="los angeles, ca">Los Angeles</option>
      </select>
      -->
    </div>
</template>

<script>
import auth from '../auth';
    
export default {
  name: 'badges',
  data() {
    return {
      badgeURL: null
    }
  },
  methods: {
    getBadge() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/badges`, {
        method: 'GET',
        headers: {
          Authorization: 'Bearer ' + auth.getToken()
        }
      })
      .then((response) => {
        if(response.ok) {
          console.log(response);
          return response.text;
        }
      })
      .then((url) => {
        console.log(url);
        this.badgeURL = url;
      })
      .catch(err => {console.log(err)})
    }
  },
  created(){
   this.badgeURL = this.getBadge();
  }

}
</script>

<style scoped>

</style>
<template>
  <div>

  </div>
</template>

<script>
import auth from '../auth'
export default {
    created() {
        auth.destroyToken;
    }
}
</script>

<style>

</style>
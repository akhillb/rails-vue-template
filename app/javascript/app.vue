<template>
  <div id="app">
    <router-view />
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
#app {
  height: 100%;
}
.app-container {
  padding: 40px;
  height: 100%;
  box-sizing: border-box;
}
</style>

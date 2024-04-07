<template>
  <MainSelect />
</template>

<script>
import MainSelect from './components/MainSelect.vue'

export default {
  name: 'App',
  components: {
    MainSelect
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>

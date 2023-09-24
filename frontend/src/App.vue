<template>
  <Loading v-if="loading"/>
  <Preview v-if="preview"/>
  <Navbar/>
  <div class="container">
    <router-view class="content"/>
    <Footer/>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
import Navbar from './components/nav/Navbar.vue';
import Footer from './components/footer/Footer.vue';
import Loading from './components/Loading.vue';
import Preview from './components/Preview.vue'
export default {
  name: "App",
  components: { Navbar, Footer, Loading, Preview },
  computed: {
    ...mapGetters(['loading', 'preview'])
  }
}
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>

<style lang="scss" scoped>
.container {
  width: 73.5%;
  margin: auto;
  display: flex;
  flex-direction: column;
  .content {
    margin: 30px 0px;
  }
}
</style>

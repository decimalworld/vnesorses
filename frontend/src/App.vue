<template>
  <div :class="showAuthent ? 'stop-scroll' : 'scrollable'">
    <Loading v-if="loading"/>
    <Preview v-if="preview"/>
    <Authenticate v-if="showAuthent" @exit="hideAuthent"/>
    <Toolbar @click-authen="displayAuthent"></Toolbar>
    <Navbar/>
    <DropBar v-show="dropVisible"></DropBar>
    <div class="container" v-show="!dropVisible">
      <router-view class="content"/>
      <Footer/>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
import Navbar from './components/nav/Navbar';
import DropBar from './components/drop/DropBar';
import Footer from './components/footer/Footer';
import Toolbar from './components/toolbar/Toolbar';
import Loading from './components/Loading';
import Preview from './components/Preview';
import Authenticate from './components/authenticate/Authenticate';
export default {
  name: "App",
  components: { Navbar, Footer, Loading, Preview, DropBar, Toolbar, Authenticate },
  computed: {
    ...mapGetters(['loading', 'preview', 'dropVisible'])
  }, 
  data() {
    return {
      showAuthent: false
    }
  },
  methods: {
    hideAuthent() {
      this.showAuthent = false
    },
    displayAuthent() {
      this.showAuthent = true
    }
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
  margin-left: -8px;
  margin-right: -8px;
  margin-top: -8px;
  margin-bottom: -8px;
  height: 100vh;
  overflow: hidden;
}
</style>

<style lang="scss" scoped>
.stop-scroll {
  height: 100vh;
  overflow: hidden;
}
.scrollable {
  height: 100%;
  overflow-y: scroll;
}
.container {
  width: 73.5%;
  height: auto;
  margin: auto;
  display: flex;
  flex-direction: column;
  .content {
    height: auto;
    margin: 0px 0px;
  }
}
</style>

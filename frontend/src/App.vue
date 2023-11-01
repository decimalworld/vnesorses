<template>
  <div :class="showAuthent ? 'stop-scroll' : 'scrollable'" ref="appContent" id="app-content">
    <Preview v-if="preview"/>
    <Authenticate v-if="showAuthent" @exit="hideAuthent"/>
    <Toolbar @click-authen="displayAuthent"></Toolbar>
    <Navbar/>
    <DropBar v-show="dropVisible"></DropBar>

    <router-view class="content" v-show="!dropVisible"/>

    <Container>
      <Footer/>
    </Container>
    <Loading v-if="loading"/>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import Navbar from './components/nav/Navbar';
import DropBar from './components/drop/DropBar';
import Footer from './components/footer/Footer';
import Toolbar from './components/toolbar/Toolbar';
import Loading from './components/Loading';
import Preview from './components/Preview';
import Authenticate from './components/authenticate/Authenticate';
import Confirmation from './components/Confirmation.vue';
import Border from './components/common/Border.vue';
import CommentSection from './components/blog/CommentSection.vue';
import Container from './components/common/Container.vue';

export default {
  name: "App",
  inject: ["helpers"],
  components: { Navbar, Footer, Loading, Preview, DropBar, Toolbar, Authenticate, Confirmation, Border, CommentSection, Container },
  computed: {
    ...mapGetters(['loading', 'preview', 'dropVisible'])
  }, 
  data() {
    return {
      showAuthent: false,
      pathName: '',
    }
  },
  methods: {
    ...mapActions(['setMasterScroll', 'setUser', 'deleteToken', 'setProfile']),
    ...mapGetters(['token']),
    hideAuthent() {
      this.showAuthent = false
    },
    displayAuthent() {
      this.showAuthent = true
    }
  },
  async beforeMount() {
    const token = this.token();
    if (token)
      Promise.all([
        this.helpers.getIdentity(token),
        this.helpers.getProfile(token)
      ])
      .then(res => {
        this.setUser(res[0].data.user);
        this.setProfile(res[1].data.user_profile);
      })
      .catch(() => {
        console.clear();
        this.deleteToken();
      })
  },
  mounted() {
    const el = this.$refs.appContent
    el.addEventListener('scroll', () => {
      this.setMasterScroll(el.scrollTop)
    }, true)
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
#app-content{
  zoom: 80%;
  height: 100%;
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
</style>

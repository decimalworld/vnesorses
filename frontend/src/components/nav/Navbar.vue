<template>
  <div class="nav">
    <div class="container">
      <Transition name="fade">
        <div v-show="scrollPosition < 400" class="label">
          <InlineSvg :src="baseBash" class="icon clickable" @click="redirectTo('home')"/>
          <Tab 
          class="news" 
          :category="{ name: 'Mới nhất', url: 'tin-tuc-24h'}"
          ></Tab>
          <div class="border"></div>
        </div>
      </Transition>
      <Transition name="fade">
        <div v-show="scrollPosition >= 400" class="label">
          <InlineSvg :src="home" class="icon"/>
        </div>
      </Transition>
      <div class="categories">
        <Tab 
          v-for="(category, index) in categories" 
          :key="index" 
          :category="category">
        </Tab>
        <InlineSvg :src="dropDown" class="dropdown" @click="showDrop"/>
      </div>
    </div>
  </div>
</template>

<script>
import { 
  GCLOUD_URL, 
  VUE_APP_ASSETS_DIR,
  CATEGORIES
} from '@/constants';
import Tab from "./Tab.vue"
import { mapActions } from 'vuex';

export default {
  name: 'Navbar',
  components: { Tab },
  methods: {
    onScroll(e) {
      this.scrollPosition = window.scrollY;
    },
    redirectTo(name, { params } = {}) {
      let route = { name }
      route = (params ? { ...route, params} : route)
      this.$router.push(route)
    },
    ...mapActions(['showDrop']),
  },
  data() {
    return {
      baseBash: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/base_bash_icon.svg`,
      home: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/home_icon.svg`,
      dropDown: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/drop_down_icon.svg`,
      longLabel: true, 
      categories: CATEGORIES,
      scrollPosition: 0
    }
  },
  mounted() {
    window.addEventListener("scroll", this.onScroll, true)
  }
}
</script>

<style lang='scss' scoped>
.clickable {
  cursor: pointer;
}
.nav {
  background-color: white;
  height: 48px;
  position: sticky;
  top: 0;
  margin-top: -10px;
  border-bottom: 1px solid #ccc;
  border-top: 1px solid #ccc;
  .container {
    width: 90%;
    height: 100%;
    margin: auto;
    display: flex;
    justify-content: flex-start;
    .fade-enter-from {
      opacity: 0;
    }
    .fade-enter-to {
      opacity: 1;
    }
    .fade-enter-active {
      transition: all 0.3s ease;
    }
    .label {
      display:flex;
      justify-content: flex-start;
      .icon {
        margin: auto 0;
        height: 30px;
        width: auto;
      }
      .news {
        margin: auto 0;
        text-align: center;
        width: 80px;
        font-size: 13px;
      }
      .border {
        border-right: 1px #909090 solid;
        height: 50%;
        margin: auto;
      }
    }
    .categories {
      margin: auto 0;
      width: 100%;
      height: 100%;
      display: flex;
      justify-content: center;
      .dropdown {
        margin: auto;
        height: 30px;
        width: auto;
        cursor: pointer;
      }
    }
  }
}
</style>

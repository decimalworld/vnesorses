<template>
  <div class="nav">
    <div class="container">
      <Transition name="fade">
        <div v-show="masterScroll < 400" class="label">
          <InlineSvg :src="baseBash" class="icon clickable" @click="redirectTo('home')"/>
          <Tab 
          class="news" 
          :category="{ name: 'Mới nhất', url_name: 'tin-tuc-24h'}"
          ></Tab>
          <Border direction="left" style="height: 50%"/>
        </div>
      </Transition>
      <Transition name="fade">
        <div v-show="masterScroll >= 400" class="label">
          <InlineSvg :src="home" class="icon clickable" @click="redirectTo('home')"/>
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
import Border from "../common/Border.vue"
import { mapActions, mapGetters } from 'vuex';

export default {
  name: 'Navbar',
  components: { Tab, Border },
  computed: {
    ...mapGetters(['masterScroll'])
  },
  methods: {
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
    }
  },
}
</script>

<style lang='scss' scoped>
.clickable {
  cursor: pointer;
}
.nav {
  background-color: white;
  height: 55px;
  position: sticky;
  top: 0;
  margin-top: -10px;
  border-bottom: 1px solid #ccc;
  border-top: 1px solid #ccc;
  z-index: 1;
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
        font-size: 15px;
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

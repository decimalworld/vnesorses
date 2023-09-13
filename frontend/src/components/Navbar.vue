<template>
  <div class="nav">
    <div class="container">
      <Transition name="fade">
        <div v-show="scrollPosition == 0" class="label">
          <InlineSvg :src="baseBash" class="icon"/>
          <div class="news">Mới nhất</div>
        </div>
      </Transition>
      <Transition name="fade">
        <div v-show="scrollPosition != 0" class="label">
          <InlineSvg :src="home" class="icon"/>
        </div>
      </Transition>
      <div class="categories">
        <div v-for="(category, index) in categories" :key="index" class="category">
          {{ category }}
        </div>
        <InlineSvg :src="dropDown" class="dropdown"/>
      </div>
    </div>
  </div>
</template>

<script>
import { GCLOUD_URL } from '@/constants';

export default {
  name: 'Navbar',
  methods: {
    onScroll(e) {
      this.scrollPosition = window.scrollY;
    },
  },
  data() {
    return {
      baseBash: `${GCLOUD_URL}/${process.env.VUE_APP_ASSETS_DIR}/base_bash_icon.svg`,
      home: `${GCLOUD_URL}/${process.env.VUE_APP_ASSETS_DIR}/home_icon.svg`,
      dropDown: `${GCLOUD_URL}/${process.env.VUE_APP_ASSETS_DIR}/drop_down_icon.svg`,
      longLabel: true, 
      categories: [
        'Thời sự',
        'Góc nhìn',
        'Thế giới',
        'Video',
        'Podcasts',
        'Kinh doanh',
        'Bất động sản',
        'Khoa học', 
        'Giải trí',
        'Thể thao',
        'Pháp luật',
        'Giáo dục',
        'Sức khỏe',
        'Đời sống',
        'Du lịch',
        'Số hóa',
        'Xe',
        'Ý kiến'
      ],
      scrollPosition: 0
    }
  },
  mounted() {
    window.addEventListener("scroll", this.onScroll, true)
  }
}
</script>

<style lang='scss' scoped>
.nav {
  background-color: white;
  height: 50px;
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
        border-right: 1px #909090 solid;
        font-size: 13px;
      }
    }
    .categories {
      margin: auto 0;
      width: 100%;
      display: flex;
      justify-content: center;
      .category {
        margin: auto;
        text-align: center;
        font-size: 13px;
      }
      .dropdown {
        margin: auto;
        height: 30px;
        width: auto;
      }
    }
  }
}
</style>

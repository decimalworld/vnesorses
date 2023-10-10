<template>
  <div class="home">
    <div class="spotlight-group">
      <div class="spotlight-news">
        <Spotlight v-if="spotlightNew" :blog="spotlightNew"/>
        <div class="border"></div>
        <div class="title-news-wrapper">
          <TitleNews 
            v-if="titleNews"
            v-for="(blog, index) in titleNews"
            :key="index"
            :blog="blog"
          ></TitleNews>
        </div>
        <div class="border"></div>
      </div>
      <div class="spotlight-ads">
        <div class="ads"></div>
      </div>
    </div>
  </div>
</template>

<script>
import Spotlight from '@/components/home/Spotlight'
import TitleNews from '@/components/home/TitleNews.vue'
import { VUE_APP_BACKEND_URL } from '@/constants'
import axios from 'axios'
export default {
  name: 'HomeView',
  components: { Spotlight, TitleNews },
  data() {
    return {
      spotlightNew: null,
      titleNews: null,
    }
  },
  beforeMount() {
    axios({
      method: 'get',
      url: `${VUE_APP_BACKEND_URL}/blogs/spotlights`
    })
    .then(response => {
      this.spotlightNew = response.data.blog
    })
    .catch(err => {
      console.clear()
      console.log(err.response.data.error_message)
    })

    axios({
      method: 'get',
      url: `${VUE_APP_BACKEND_URL}/blogs/title_news`
    })
    .then(response => {
      this.titleNews = response.data.blogs
    })
    .catch(err => {
      console.clear()
      console.log(err.response.data.error_message)
    })
  }
}
</script>

<style lang="scss" scoped>
.home {
  height: auto;
  background-color: white;
  .spotlight-group{
    display: grid;
    height: auto;
    grid-template-columns: 875px auto;
    .spotlight-news{
      .border {
        width: 98%;
        border-bottom: 1px solid #ccc;
        margin: 0 auto;
      }
    }
    .title-news-wrapper {
      display: grid;
      grid-template-columns: 34% 34% 32%;
    }
    .spotlight-ads{
      height: auto;
      .ads {
        height: 675px;
        background-color: cyan;
        margin: 20px 24px 0px 24px;
      }
    }
  }
}
</style>

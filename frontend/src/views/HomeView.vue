<template>
  <div class="home">
    <div class="spotlight-group">
      <div class="spotlight-news">
        <Spotlight v-if="spotlightNew" :blog="spotlightNew"/>
        <Border direction="bottom"/>
        <div class="title-news-wrapper">
          <TitleNews 
            v-if="titleNews"
            v-for="(blog, index) in titleNews"
            :key="index"
            :blog="blog"
          ></TitleNews>
        </div>
        <Border direction="bottom"/>
      </div>
      <div class="spotlight-ads">
        <div class="ads"></div>
      </div>
    </div>
    <div class="news-container">
      <HotNews v-if="hotNews" :hotNews="hotNews"></HotNews>
      <Border direction="left"/>
      <div class="categorized-news">
      <div class="categories">
        <CategoryGroup/>
        <Border direction="bottom"/>
      </div>
      </div>
    </div>
  </div>
</template>

<script>
import HotNews from '@/components/home/HotNews';
import Spotlight from '@/components/home/Spotlight';
import TitleNews from '@/components/home/TitleNews.vue';
import CategoryGroup from '@/components/home/CategoryGroup.vue';

import Border from '@/components/common/Border'
import { VUE_APP_BACKEND_URL } from '@/constants'
import axios from 'axios'

export default {
  name: 'HomeView',
  components: {
    Spotlight,
    TitleNews,
    HotNews,
    Border,
    CategoryGroup
},
  data() {
    return {
      spotlightNew: null,
      titleNews: null,
      hotNews: null,
    }
  },
  async beforeMount() {
    await Promise.all([
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
      }),
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
      }),    
      axios({
        method: 'get',
        url: `${VUE_APP_BACKEND_URL}/blogs/commons`,
        data: {
          per: 12
        }
      })
      .then(response => {
        this.hotNews = response.data.blogs
      })
      .catch(err => {
        console.clear()
        console.log(err.response.data.error_message)
      })
    ])
  }
}
</script>

<style lang="scss" scoped>
.home {
  height: auto;
  background-color: white;
  display: flex;
  flex-direction: column;
  .spotlight-group{
    display: grid;
    height: auto;
    grid-template-columns: 875px auto;
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
  .news-container{
    width: 100%;
    height: auto;
    display: grid;
    margin: 10px 0px;
    grid-template-columns: 36.5% 0px auto;
  }
}
</style>

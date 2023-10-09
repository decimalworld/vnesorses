<template>
  <div class="home">
    <div class="spotlight-group">
      <div class="spotlight-news">
        <Spotlight v-if="spotlightNew" :blog="spotlightNew"/>
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
import { VUE_APP_BACKEND_URL } from '@/constants'
import axios from 'axios'
export default {
  name: 'HomeView',
  components: { Spotlight },
  data() {
    return {
      spotlightNew: null
    }
  },
  beforeMount() {
    axios({
      method: 'get',
      url: `${VUE_APP_BACKEND_URL}/spotlights`
    })
    .then(response => {
      this.spotlightNew = response.data.blog
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
  height: 1000px;
  background-color: white;
  .spotlight-group{
    display: grid;
    height: 665px;
    grid-template-columns: 875px auto;
    .spotlight-news{
      .border {
        width: 98%;
        border-bottom: 1px solid #ccc;
        margin: 0 auto;
      }
    }
    .spotlight-ads{
      height: 100%;
      .ads {
        height: 100%;
        background-color: cyan;
        margin: 20px 24px 0px 24px;
      }
    }
  }
}
</style>

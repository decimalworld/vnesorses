<template>
<div class="show-blog-view" v-if="blog">
  <div class="blog-view">
    <div class="blog-container">
      <div class="social">
  
      </div>
      <BlogContent :blog="blog"/>
    </div>
    <div class="ads-container">
      <div class="ads"></div>
    </div>
  </div>
</div>
</template>

<script>
import { VUE_APP_BACKEND_URL } from '@/constants';
import BlogContent from '@/components/blog/BlogContent';
import Border from '@/components/common/Border.vue';
import axios from 'axios';

export default {
  name: "showBlogView",
  components: { BlogContent, Border },
  data() {
    return {
      blog: null,
    }
  },
  beforeMount() {
    const id = this.$route.params.id
    axios({
      method: 'get',
      url: `${VUE_APP_BACKEND_URL}/blogs/commons/${id}`
    })
    .then(response => {
      this.blog = response.data.blog
    })
  }
}
</script>

<style lang="scss" scoped>
.show-blog-view {
  .blog-view{
    height: auto;
    background-color: white;
    display: grid;
    grid-template-columns: 950px 1fr;
    .blog-container{
      height: auto;
      width: 100%;
      display: grid;
      resize: none;
      grid-template-columns: 75px 1fr;
      .social {
        background-color: blue;
      }
    }
    .ads-container{
        height: 670px;
        padding: 20px 20px 0px 20px;
        .ads {
          height: 100%;
          background-color: cyan;
        }
      }
  }
}
</style>

<style module>
#htmlContainer {
  width: auto;
}
#htmlContainer > p {
  width: auto;
}
</style>

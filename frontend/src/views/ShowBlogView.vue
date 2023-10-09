<template>
<div class="show-blog-view" v-if="blog">
  <div class="blog-container">
    <div class="social">

    </div>
    <div class="content">
      <div class="tag">
        <span>
          Sức khỏe > Tin tức
        </span>
        <span>
          Ngày tháng năm
        </span>
      </div>
      <div class="title">{{  blog.title }}</div>
      <div class="body" v-html="blog.body"></div>
    </div>
  </div>
  <div class="ads-container">
    <div class="ads"></div>
  </div>
</div>
</template>

<script>
import { VUE_APP_BACKEND_URL } from '@/constants';
import axios from 'axios';

export default {
  name: "showBlogView",
  data() {
    return {
      blog: null
    }
  },
  beforeMount() {
    const id = this.$route.params.id
    axios({
      method: 'get',
      url: `${VUE_APP_BACKEND_URL}/blogs/${id}`
    })
    .then(response => {
      this.blog = response.data.blog
    })
  }
}
</script>

<style lang="scss" scoped>
.show-blog-view{
  height: 1000px;
  background-color: white;
  display: grid;
  grid-template-columns: 865px 1fr;
  .blog-container{
    height: auto;
    width: 100%;
    display: grid;
    resize: none;
    grid-template-columns: 75px 755px;
    .social {
      background-color: blue;
    }
    .content {
      width: 100%;
      display: flex;
      flex-direction: column;
      margin: 0px 10px;
      .tag{
        height: 60px;
        display: flex;
        justify-content: space-between;
        width: 100%;
        span {
          margin: auto 10px;
        }
      }
      .title {
        font-size: 32px;
        font-weight: bold;
        text-align: left;
      }
      .body {
        width: 100%;
        margin: 30px 0px;
        font-size: 18px;
        text-align: left;
        line-height: 30px;
        
        :deep(img) {
          width: 100% !important;
          height: auto;
          object-fit:contain;
        }
      }
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
</style>

<style module>
#htmlContainer {
  width: auto;
}
#htmlContainer > p {
  width: auto;
}
</style>

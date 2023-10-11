<template>
<div class="show-blog-view" v-if="blog">
  <div class="blog-container">
    <div class="social">

    </div>
    <div class="content">
      <div class="meta">
        <div class="tag">
          <span>
            {{ blog.tag.category_name }}  
          </span>
          <template v-if="blog.tag.tag_name">
            <InlineSvg :src="rightArrow" class="icon"></InlineSvg>
            <span>
              {{ blog.tag.tag_name }}
            </span>
          </template>
        </div>
        <div class="date">
          <span>
            {{ blog.created_at }}
          </span>
        </div>
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
import { GCLOUD_URL, VUE_APP_ASSETS_DIR, VUE_APP_BACKEND_URL } from '@/constants';
import axios from 'axios';

export default {
  name: "showBlogView",
  data() {
    return {
      blog: null,
      rightArrow: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/right_arrow_icon.svg`, 
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
.show-blog-view{
  height: auto;
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
      .meta {
        height: 60px;
        display: flex;
        justify-content: space-between;
        width: 100%;
        div {
          height: 100%;
          display: flex;
          span {
            margin: auto 0px;
            font-size: 18px;
          }
          .icon {
            margin: auto 0;
            height: 30px;
            width: 30px;
          }
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

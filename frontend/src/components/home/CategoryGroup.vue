<template>
<div class="category-group">
  <div class="tag-link-group">
    <ClickableTitle
      class="category-link"
      :text="category.name"
      @click="helpers.goToCategory(category.url_name)"
    />
    <ClickableTitle
      class="tag-link"
      v-for="(tag, index) in category.tags.slice(0, 5)"
      :key="index"
      :text="tag.name"
      @click="helpers.goToTag(category.url_name, tag.url_name)"
    />
  </div>
  <div class="tag-latest-news">
    <div class="latest-container">
      <div class="latest" v-if="mainBlog">
        <img :src="mainBlog.cover.full_path" class="image"/>
        <div class="content">
          <ClickableTitle :text="mainBlog.title" @click="helpers.goToBlog(mainBlog.id)"/>
          <div class="summary" v-html="mainBlog.summary">
          </div>
        </div>
      </div>
      <Border
        direction="left"
        style="height: 85%"
      />
      <div class="side-blog" v-if="sideBlog">
        <ClickableTitle :text="sideBlog.title" @click="helpers.goToBlog(sideBlog.id)"/>
        <div class="summary" v-html="sideBlog.summary"/>
      </div>
    </div>
    <Border direction="bottom"/>
    <div class="title-blogs" v-if="titleBlogs">
      <template
        v-for="(titleBlog, index) in titleBlogs"
        :key="index"
      >
      <div class="title-blog">
        <ClickableTitle 
          :text="titleBlog.title" 
          :listItem="true"
          @click="helpers.goToBlog(titleBlog.id)"
        />
      </div>
      </template>
    </div>
  </div>
</div>
</template>

<script>
import { defineAsyncComponent } from 'vue';
import ClickableTitle from '../common/ClickableTitle.vue';
import Border from '../common/Border.vue';
import { VUE_APP_BACKEND_URL } from '@/constants';
import axios from 'axios';
const AsyncCard = defineAsyncComponent({
  loader: () => import('../Card.vue')
})
export default {
  name: "categoryGroup",
  components: { ClickableTitle, AsyncCard, Border },
  inject: ["helpers"],
  props: {
    category: Object
  },
  data() {
    return {
      ready: null,
      mainBlog: null,
      sideBlog: null,
      titleBlogs: null,
    }
  },
  async beforeMount() {
    await axios({
      method: 'post',
      url: `${VUE_APP_BACKEND_URL}/categories/${this.category.id}/blogs?per=5`
    })
    .then(response => {
      [this.mainBlog, this.sideBlog, ...this.titleBlogs] = response.data.blogs
    })
    .catch(err => {
      console.clear()
      console.log(err.response.data.error_message)
    })
  }
}
</script>

<style scoped lang="scss">
.category-group {
  margin: 15px 0px;
  padding: 0px 0px;
  height: 310px;
  width: 100%;
  .tag-link-group {
    display: flex;
    height: 30px;
    .category-link{
      font-size: 22px;
      padding: 2px 0px;
      margin-right: 5px;
      border-bottom: 1px solid rgb(197, 4, 62);
      position: relative;
      bottom: 0;
    }
    .tag-link{
      margin: 0px 10px;
      font-size: 15px;
      display: flex;
      font-weight: normal !important;
    }
    :deep(span){
      margin-top: auto;
      margin-bottom: 5px;
    }
  }
  .tag-latest-news{
    height: 100%;
    .latest-container {
      display: grid;
      grid-template-columns: 520px 0px auto;
      height: 180px;
      padding: 5px 0;
      .latest {
        height: 100%;
        width: auto;
        display: grid;
        grid-template-columns: 250px auto;
        .image {
          height: 85%;
          width: 100%;
          margin: auto 0px;
        }
        .content {
          height: 85%;
          margin: auto 20px;
          .summary {
            height: auto;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 4;
            width: 100%;
            text-align: start;
            font-size: 16px;
            margin: 10px 2px;
            overflow: clip;
            text-overflow: ellipsis;
            :deep(p) {
              margin: auto;
            }
          }
        }
      }
      .side-blog{
        height: 85%;
        margin: auto 20px;
        .summary {
          height: auto;
          display: -webkit-box;
          -webkit-box-orient: vertical;
          -webkit-line-clamp: 4;
          width: 100%;
          text-align: start;
          font-size: 16px;
          margin: 10px 2px;
          overflow: clip;
          text-overflow: ellipsis;
          :deep(p) {
            margin: auto;
          }
        }
      }
    }
    .title-blogs{
      height: auto;
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      .title-blog {
        display: flex;
        margin: 20px 15px;
      }
    }
  }
}
</style>

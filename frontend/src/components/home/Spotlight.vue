<template>
  <div class="spotlight">
    <div class="cover">
      <img :src="blog.cover.full_path" class="cover-image">
    </div>
    <div class="summary-wrapper">
      <div class="title" @click="goToBlog(blog.id)">
        {{ blog.title }}
      </div>
      <div class="summary" v-html="blog.summary"></div>
    </div>
  </div>
</template>

<script>
import router from '@/router';

export default {
  name: "spotlight",
  props: { 
    blog: Object
  },
  methods: {
    goToBlog(id) {
      router.push({ path: `blog/${id}` })
    }
  }
}
</script>

<style scoped lang="scss">
.spotlight {
  height: 345px;
  width: 875px;
  margin-top: 23px;
  margin-bottom: 23px;
  margin-left: 10px;
  display: flex;
  .cover-image {
    height: 100%;
    width: 580px;
  }
  .summary-wrapper {
    text-align: left;
    margin: 5px 20px;
    .title {
      font-size: 25px;
      font-weight: bold;
      &:hover {
        color: blue;
        cursor: pointer;
      }
    }
    .summary {
      margin: 15px auto;
      font-size: 18px;
    }
  }
}
</style>

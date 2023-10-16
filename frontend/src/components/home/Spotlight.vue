<template>
  <div class="spotlight">
    <div class="cover">
      <img :src="blog.cover.full_path" class="cover-image">
    </div>
    <div class="summary-wrapper">
      <ClickableTitle
        :text="blog.title"
        style="font-size: 25px"
        @click="helpers.goToBlog(blog.id)"
      ></ClickableTitle>
      <div class="summary" v-html="blog.summary"></div>
    </div>
  </div>
</template>

<script>
import ClickableTitle from '@/components/common/ClickableTitle';

export default {
  name: "spotlight",
  components: { ClickableTitle },
  inject: ['helpers'],
  props: { 
    blog: Object
  },
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
    .summary {
      margin: 15px auto;
      font-size: 18px;
    }
  }
}
</style>

<template>
  <div class="news-wrapper">
    <div class="title" @click="helpers.goToBlog(blog.id)">
      <span>{{ blog.title }}</span>
    </div>
    <div class="cover-wrapper">
      <img :src="blog.cover.full_path" class="cover">
    </div>
  </div>
</template>

<script>
export default {
  name: "titleNews",
  inject: ["helpers"],
  props: {
    blog: Object,
  },
}
</script>

<style scoped lang="scss">
.news-wrapper {
  height: 280px;
  width: auto;
  margin: 10px 10px;
  .title {
    height: 75px;
    display: flex;
    text-align: left;
    &:hover {
      cursor: pointer;
      color: blue;
    }
    span {
      display: -webkit-box;
      -webkit-box-orient: vertical;
      -webkit-line-clamp: 2;
      margin: auto;
      text-overflow: ellipsis;
      overflow: hidden;
      font-size: 18px;
      line-height: 25px;
      font-weight: bold;
    }
  }
  .cover-wrapper{
    width: 100%;
    height: 170px;
    .cover {
      height: 100%;
      width: 100%;
    }
  }
}
</style>

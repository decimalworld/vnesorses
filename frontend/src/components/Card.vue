<template>
  <div class="card">
    <ClickableTitle 
      :text="blog.title"
      class="card-title"
      @click="goToBlog(blog.id)"
    />
    <div class="card-content">
      <div class="cover">
        <img :src="blog.cover.full_path" class="cover-image">
      </div>
      <div class="body">
        <div v-html="blog.summary">
        </div>  
      </div>
    </div>
  </div>
</template>

<script>
import router from '@/router';
import ClickableTitle from '@/components/common/ClickableTitle';

export default {
  name: "card",
  components: { ClickableTitle },
  props: {
    blog: Object,
    navigatable: {
      type: Boolean,
      default: false
    },
  },
  methods: {
    goToBlog(id) {
      router.push({ path: `blog/${id}` })
    }
  }
}
</script>

<style scoped lang="scss">
.card {
    height: auto;
    width: 380px;
    background-color: #fff;
    display: table;
    padding: 0px 10px;
    .card-title {
      min-height: 25px;
      display: flex;
    }
    .card-content {
      height: 110px;
      width: 100%;
      display: flex;
      flex-direction: row;
      margin: 5px 0px;
      .cover {
        flex-shrink: 0;
        width: 150px;
        height: 100%;
        display: flex;
        .cover-image {
          margin: auto;
          height: 100%;
          width: 100%;
        }
      }
      .body {
        height: 100%;
        overflow: clip;
        margin-left: 5px;
        div {
          height: 100%;
          display: -webkit-box;
          -webkit-box-orient: vertical;
          -webkit-line-clamp: 6;
          height: 100%;
          width: 100%;
          text-align: start;
          font-size: 15px;
          margin: 3px 2px;
          overflow: clip;
          text-overflow: ellipsis;
          :deep(p) {
            margin: 0px;
          }
        }
      }
    }
  }
</style>

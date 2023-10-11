<template>
  <div class="card">
    <div 
      :class="`card-title ${navigatable ? 'clickable' : ''}`"
      @click="goToBlog(blog.id)"
    >
      <span>
        {{ blog.title }}
      </span>
    </div>
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

export default {
  name: "card",
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
    padding: 5px 10px;
    .card-title {
      min-height: 25px;
      display: flex;
      span {
        text-align: start;
        font-weight: bold;
      }
    }
    .clickable {
      &:hover{
        color: blue;
        cursor: pointer;
      }
    }
    .card-content {
      height: 110px;
      width: 100%;
      display: flex;
      flex-direction: row;
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

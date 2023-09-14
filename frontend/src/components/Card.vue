<template>
  <div class="card">
    <div class="card-title">
      <span>
        {{ getBlogTitle() }}
      </span>
    </div>
    <div class="card-content">
      <div class="cover">
        <img :src="getBlogCover()" class="cover-image">
      </div>
      <div class="body">
        <div>
          {{ getBlogSummary() }}
        </div>  
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  name: "card",
  methods: {
    ...mapGetters([
      'getBlogTitle',
      'getBlogSummary',
      'getBlogCover',
    ])
  }
}
</script>

<style scoped lang="scss">
.card {
    height: auto;
    width: 380px;
    background-color: #fff;
    display: table;
    .card-title {
      min-height: 25px;
      display: flex;
      span {
        text-align: start;
        padding: 5px 3px;
        font-weight: bold;
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
          height: 95%;
          width: 95%;
        }
      }
      .body {
        height: 115px;
        overflow: clip;
        div {
          display: -webkit-box;
          -webkit-box-orient: vertical;
          -webkit-line-clamp: 6;
          width: 100%;
          text-align: start;
          font-size: 15px;
          margin: 3px 2px;
          overflow: clip;
          text-overflow: ellipsis;
        }
      }
    }
  }
</style>

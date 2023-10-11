<template>
  <div class="hot-news">
    <div class="card-container">
      <template v-for="(blog, index) in hotNews" :key="index">
        <AsyncCard
          v-if="hotNews"
          :blog="blog"
          :navigatable="true"
          class="card"
          >
        </AsyncCard>
      <div class="horizontal-border" v-if="index < hotNews.length"></div>
    </template>
    </div>
  </div>
</template>

<script>
import { defineAsyncComponent } from 'vue';

const AsyncCard = defineAsyncComponent({
  loader: () => import('../Card.vue'),
})

export default {
  name: "hotNews",
  components: { AsyncCard },
  props: {
    hotNews: Array
  }
}
</script>

<style lang="scss" scoped>
.hot-news{
  height: auto;
  margin-right: 25px;
  .card-container{
    .card{
      margin: 12px 0px;
    }
  }
}
</style>

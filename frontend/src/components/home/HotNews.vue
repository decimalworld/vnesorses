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
        <Border direction="bottom"/>
    </template>
    </div>
  </div>
</template>

<script>
import { defineAsyncComponent } from 'vue';
import Border from '@/components/common/Border.vue';

const AsyncCard = defineAsyncComponent({
  loader: () => import('../Card.vue'),
})

export default {
  name: "hotNews",
  components: { AsyncCard, Border },
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
      margin: 15px 0px;
    }
  }
}
</style>

<template>
  <div class="categories">
    <div class="main-div">
      <Category 
        v-for="(category, index) in categories"
        :key="index"
        :category="category"
      ></Category>
    </div>
    <div class="other">

    </div>
  </div>
</template>

<script>
import { CATEGORIES } from '@/constants';
import Category from './Category.vue'
export default {
  name: "Categories",
  components: { Category },
  data() {
    return {
      categories: CATEGORIES
    }
  }
}
</script>

<style scoped lang="scss">
.categories {
  display: grid;
  grid-template-columns: 85% 15%;
  width: 100%;
  height: 100vh;
  .main-div{
    display: grid;
    grid-template-columns: repeat(6, 16.6%);
    overflow-y: scroll;
    overflow-x: clip;
  }
  .other {
    background-color: green;
  }
}
</style>

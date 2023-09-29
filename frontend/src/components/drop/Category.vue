<template>
  <div class="category">
    <div class="title text">
      {{ category.name }}
    </div>
    <div 
      class="tag" 
      v-for="(tag, index) in category.tags.slice(...(limited ? [0, 4] : []))"
      :key="index"
    >
      <div 
        class="text" 
        @click="redirectTo('tag', { 
          params: {
            category: dasherize(category.name), 
            tag: dasherize(tag.name), 
          }})"> {{ tag.name }} </div>
    </div>
    <div class="more-btn">
      <div class="border" v-show="limited && category.tags.length >=4"></div>
      <div class="text" v-show="limited && category.tags.length >=4" @click="limited = !limited"> Xem thêm </div>
    </div>
  </div>
</template>

<script>
import { dasherize } from '@/mixin'

export default {
  name: "Category",
  props: {
    category: Object
  },
  data() {
    return {
      limited: true,
    }
  },
  methods: {
    dasherize,
    redirectTo(name, { params } = {}) {
      let route = { name }
      route = (params ? { ...route, params} : route)
      this.$router.push(route)
    }
  }
}
</script>

<style scoped lang="scss">
.category {
  width: 100%;
  margin: 15px auto;
  .title {
    margin-top: 5px;
    font-size: 18px;
    font-weight: bold;
    text-align: start;
    color: rgb(197, 4, 62);
    &:hover {
      color: rgb(255, 4, 62);
    }
  }
  .text{
    &:hover {
      text-decoration: underline;
      cursor: pointer;
    }
  }
  .tag {
    height: 35px;
    display: flex;
    .text {
      font-size: 14px;
      margin: auto 0;
    };
  }
  .more-btn {
    height: 20px;
    display: flex;
    flex-direction: column;
    
    .border {
      border-top: 1px solid #aaa;
      margin-right: 45%;
      margin-bottom: 2px;
    }
    .text {
      color: #aaa;
      text-align: start;
      margin: auto 0;
      font-size: 12px;
      &:hover{
        color: blue;
      }
    }
  }
  .tag:nth-child(2) {
    margin-top: 5px;
  }
  .tag:nth-last-child(2) {
    margin-bottom: 10px;
  }
}
</style>

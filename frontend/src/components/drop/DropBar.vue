<template>
  <div class="drop-bar">
    <div class="drop-container">
      <div class="drop-title">
        <div class="text"> 
          <div class="content">Tất cả chuyên mục</div> 
        </div>
        <Button class="button" @click="hideDrop"></Button>
      </div>
      <Categories></Categories>
    </div>
  </div>
</template>

<script>
import Button from './Button.vue';
import Categories from './Categories.vue';
import { mapActions } from 'vuex';
export default {
  name: "DropBar",
  components: { Button, Categories },
  methods: {
    ...mapActions(['hideDrop'])
  }
}
</script>

<style scoped lang="scss">
.drop-bar {
  position: sticky;
  top: 50px;
  width: 100%;
  background-color: #fff;
  height: 92vh;
  .drop-container {
    width: 72%;
    height: 100%;
    margin: auto;
    .drop-title {
      height: 55px;
      width: 100%;
      display: block;
      border-bottom: 1px solid #303030;
      .text {
        float: left;
        width: auto;
        height: 100%;
        display: flex;
        .content {
          margin: auto 0;
          font-size: 20px;
          font-weight: bold;
          color:#303030;
        }
      };
      .button {
        float: right;
      }
    }
  }
}
</style>

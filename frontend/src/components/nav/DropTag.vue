<template>
  <Transition name="shift">
    <div class="droptag">
      <div 
        v-for="(tag, index) in category.tags" 
        :key="index" 
        class="tag"
        @click="helpers.goToTag(category.url_name, tag.url_name)"
      >
        <div class="text">{{ tag.name }}</div>
      </div>
    </div>
  </Transition>
</template>

<script>
export default {
  name: "Tag",
  inject: ["helpers"],
  props: {
    category: Object,
  },
}
</script>

<style scoped lang="scss">
.droptag {
  position: absolute;
  top: 55px;
  background-color: white;
  display: grid;
  grid-template-columns: auto;
  color: #333;
  border-top: 1px solid rgb(164, 9, 40);
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.6), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  .tag {
    height: 40px;
    width: 200px;
    display: flex;
    .text {
      margin: auto 10px;
      text-align: start;
      font-size: 14px;
      cursor: pointer;
      &:hover {
        text-decoration: underline;
      }
    }
  }
}
.shift-enter-from {
  opacity: 0;
  top: 60px;
}
.shift-enter-active {
  transition: all 0.1s ease-in;
}
</style>

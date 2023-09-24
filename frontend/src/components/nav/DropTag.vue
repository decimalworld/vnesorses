<template>
  <Transition name="shift">
    <div class="droptag">
      <div v-for="(tag, index) in tags" :key="index" class="tag">
        <div class="text">{{ tag.name }}</div>
      </div>
    </div>
  </Transition>
</template>

<script>
export default {
  name: "Tag",
  props: {
    tags: Array
  }
}
</script>

<style scoped lang="scss">
.droptag {
  position: absolute;
  top: 50px;
  display: grid;
  grid-template-columns: auto;
  border-top: 1px solid rgb(164, 9, 40);
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.6), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  .tag {
    height: 40px;
    width: 200px;
    display: flex;
    .text {
      margin: auto 5px;
      text-align: start;
      font-size: 15px;
    }
  }
}
.shift-enter-from {
  top: 60px;
}
.shift-enter-active {
  transition: all 0.1s ease-in;
}
</style>

<template>
  <div class="background">
    <slot></slot>
  </div>
</template>

<script>
export default {
  name: "background"
}
</script>

<style scoped lang="scss">
.background {
  height: 100%;
  width: 100%;
  background-color: rgba($color: #000000, $alpha: 0.5);
  position: fixed;
  z-index: 2;
  top: 0;
  display: flex;
}
</style>

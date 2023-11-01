<template>
  <div class="container">
    <slot class="content"/>
  </div>
</template>

<script>
export default {
  name: "container",
}
</script>

<style scoped lang="scss">
.container {
  width: 73.5%;
  height: auto;
  margin: auto;
  display: flex;
  flex-direction: column;
  .content {
    min-height: 100%;
    height: auto;
    margin: 0px 0px;
    top: 100px;
  }
}
</style>

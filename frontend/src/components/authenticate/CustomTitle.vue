<template>
  <div class="title">
    <slot></slot>
  </div>
</template>

<script>
export default {
  name: 'customTitle'
}
</script>

<style scoped lang="scss">
.title {
  margin: 36px auto;
  font-size: 18px;
}
</style>

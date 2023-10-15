<template>
  <div :class="`border-${direction}`">

  </div>
</template>

<script>
export default {
  name: "border",
  props: {
    direction: {
      type: String,
      default: 'bottom'
    }
  }
}
</script>

<style scoped lang="scss">
.border-bottom{
  width: 98%;
  border-bottom: 1px solid #ccc;
  margin: 0 auto;
}
.border-left{
  height: 98%;
  border-left: 1px solid #ccc;
  margin: auto 0;
}
</style>

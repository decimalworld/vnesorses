<template>
<div class="tooltip">
  <slot></slot>  
</div>
</template>

<script>
export default {
  name: 'tooltip',
}
</script>

<style scoped lang="scss">
.tooltip{
  visibility: hidden;
  position: absolute;
  background-color: white;
  border: 1px solid #ccc;
  top: -30px;
  border-radius: 10px;
  padding: 5px;
  text-wrap: nowrap;
  
}
</style>

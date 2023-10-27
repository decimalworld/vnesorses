<template>
<div class="button">
  <slot></slot>
</div>
</template>

<script>
export default {
  name: "customButton"
}
</script>

<style scoped lang="scss">
.button {
  width: 80%;
  margin: auto;
  padding: 16px 0px;
  position: relative;
  border-radius: 5px;
  font-size: 18px;
  display: flex;
  justify-content: center;
  &:hover {
    cursor: pointer;
  }
  
  :slotted(span) {
    margin: auto;
  }
}
</style>


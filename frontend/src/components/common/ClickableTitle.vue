<template>
  <div 
      class="clickable"
  >
    <span>{{ text }}</span>
  </div>
</template>

<script>
export default {
  name: "clickableTitle",
  props: {
    text: String,
  }
}
</script>

<style scoped lang="scss">
  .clickable {
      &:hover{
        color: blue;
        cursor: pointer;
      }
      text-align: start;
      font-weight: bold;
      font-size: 18px;
    }
</style>

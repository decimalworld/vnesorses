<template>
  <div 
      class="clickable"
  >
    <li v-if="listItem"></li>
    {{ text }}
  </div>
</template>

<script>
export default {
  name: "clickableTitle",
  props: {
    text: String,
    listItem: {
      type: Boolean,
      default: false,
    }
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
      display: flex;
      li {
        margin-right: -10px;
      }
    }
</style>

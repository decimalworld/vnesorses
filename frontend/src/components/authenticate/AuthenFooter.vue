<template>
  <div class="footer">
    <slot></slot>
  </div>
</template>

<script>
export default {
  name: "authenFooter"
}
</script>

<style scoped lang="scss">
.footer {
  padding: 35px 95px;
  color: #aaa;
  :deep(em) {
    text-decoration: underline;
    font-style: normal;
    color: rgb(9, 56, 212);
    &:hover {
      cursor: pointer;
    }
  }
}
</style>

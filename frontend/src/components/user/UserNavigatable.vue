<template>
  <div class="navigate-group">
    <div :class="this.$route.name=='userProfile' ? 'disable' : 'navigate'">Thông tin chung</div>
    <div class="navigate">Ý kiến của bạn</div>
    <div class="navigate">Tin đã lưu</div>
    <div class="navigate">Tin đã xem</div>
    <div class="navigate">Thoát</div>
  </div>
</template>

<script>
export default {
  name: "userNavigatable"
}
</script>

<style scoped lang="scss">
.navigate-group {
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  width: 100%;
  margin: 0px 25px;
  text-align: start;
  font-size: 20px;
  .navigate {
    &:hover{
      color: rgb(255, 0, 76);
    }
  }
  .disable {
    font-weight: bold;
  }
}
</style>

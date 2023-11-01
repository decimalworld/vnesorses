<template>
  <div class="avatar-wrapper">
    <img :src="src" class="avatar"/>
  </div>
</template>

<script>
export default {
  name: "avatar",
  props: {
    src: String
    
  }
}
</script>

<style scoped lang="scss">
.avatar-wrapper{
  margin: 5px 0px;
  border-radius: 50%;
  overflow: hidden;
  height: 100%;
  width: 100%;
  display: block;
  .avatar{
    height: 100%;
    width: 100%;
  }
}
</style>

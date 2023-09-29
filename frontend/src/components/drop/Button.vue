<template>
  <div class="button">
    <div class="content">
      Đóng
    </div>
    <InlineSvg :src="exit" class="exit" fill="blue"/>
  </div>
</template>

<script>
import { GCLOUD_URL, VUE_APP_ASSETS_DIR } from '@/constants';

export default {
  name: "Button",
  data() {
    return {
      exit: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/basic_exit_icon.svg`
    }
  }
}
</script>

<style scoped lang="scss">
.button {
  height: 100%;
  width: 100px;
  display: flex;
  cursor: pointer;
  .content {
    margin: auto 0;
    text-align: end;
    width: 60%;
    font-size: 15px;
    font-weight: bold;
    color: rgb(0, 76, 255);
  }
  .exit {
    margin: auto;
    height: 15px;
    width: auto;
  }
}
</style>

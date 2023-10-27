<template>
  <InlineSvg :src="pathTo(src)" class="custom-icon"/>
</template>

<script>
import { GCLOUD_URL, VUE_APP_ASSETS_DIR } from '@/constants';

export default {
  name: "customIcon",
  methods:{
    pathTo(src) {
      return `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/${src}`
    }
  },
  props: {
    src: String
  }
}
</script>

<style scoped lang="scss">
.custom-icon {
  position: absolute;
  top: 0;
  bottom: 0;
  margin: auto 0;
  height: 20px;
  width: auto;
}
</style>

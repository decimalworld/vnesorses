<template>
  <div class="preview" @click="togglePreview()">
    <Card></Card>
  </div>
</template>

<script>
import Card from './Card'
import { mapActions } from 'vuex';
export default {
  name: "preview",
  components: { Card },
  methods: {
    ...mapActions(['togglePreview'])
  }
}
</script>

<style scoped lang="scss">
.preview {
  top: 0;
  z-index: 1;
  height: 100%;
  width: 100%;
  background-color: rgba($color: #000000, $alpha: 0.5);
  position: fixed;
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>

<template>
  <Background>
    <span></span>
  </Background>
</template>

<script>
import Background from './common/Background';
export default {
  name: "loading",
  components: { Background }
}
</script>

<style scoped lang="scss">
@keyframes spin {
  to {
    transform: rotateZ(360deg);
  }
};
span {
  display: block;
  width: 60px;
  height: 60px;
  margin: auto;
  border: 3px solid transparent;
  border-top-color: #fff;
  border-bottom-color: #fff;
  border-radius: 50%;
  animation: spin ease 1s infinite;
}
</style>

<template>
<div class="modal">
  <div class="close" @click="$emit('exit')">
    <CustomIcon src="basic_exit_icon.svg" class="icon"/>
  </div>
  <slot>

  </slot>
</div>
</template>

<script>
import CustomIcon from './CustomIcon';

export default {
  name: "modal",
  components: { CustomIcon },
  emits: ['exit'],
}
</script>

<style scoped lang="scss">
.modal {
  margin: 115px auto auto auto;
  background-color: white;
  display: flex;
  flex-direction: column;
  position: relative;
  .close{
    position: absolute;
    right: -19px;
    top: -19px;
    height: 38px;
    width: 38px;
    border-radius: 50%;
    margin: auto;
    background-color: white;
    border: 1px solid #eee;
    display: flex;
    &:hover {
      cursor: pointer;
    }
    .icon {
      left: 0px;
      right: 0px;
      margin: auto;
    }
  }
}
</style>

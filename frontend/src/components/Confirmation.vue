<template>
<Background>
  <Modal class="modal">
    <div class="title">
      Thoát tài khoản
    </div>
    <Border/>
    <div class="content">
      Bạn có muốn thoát tài khoản?
    </div>
  </Modal>
</Background>
</template>

<script>
import Background from './common/Background';
import Modal from './common/Modal';
import Border from './common/Border';
export default {
  name: 'confirmation',
  components: { Background, Modal, Border }
}
</script>

<style scoped lang="scss">
.modal {
  height: 230px;
  width: 520px;
  .title {
    font-size: 21px;
    font-weight: bold;
    margin: 20px auto;
  }
  .content{
    text-align: left;
    font-size: 20px;
    margin: 22px 22px;
  }
}
</style>

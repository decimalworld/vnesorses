<template>
<Background>
  <Confirmation 
    @exit="$emit('exit')"
    @confirmed="toLogin" 
    v-if="afterAuth"/>
  <Modal class="autheticate-modal" @exit="$emit('exit')" v-else>
    <div class="modal-tab-group">
      <div 
        :class="`modal-tab ${login ? 'focus' : ''}`" 
        @click="login=true">
        Đăng nhập
      </div>
      <div 
        :class="`modal-tab ${login ? '' : 'focus'}`"
        @click="login=false">
        Tạo tài khoản
      </div>
    </div>
    <div class="modal-view-group">
      <LoginView v-if="login==true" @exit="$emit('exit')"></LoginView>
      <SignUpView v-else @after-auth="afterAuth=true"></SignUpView>
    </div>
  </Modal>
</Background>
</template>

<script>
import LoginView from './LoginView';
import SignUpView from './SignUpView';
import Confirmation from './Confirmation';
import Background from '../common/Background';
import Modal from '../common/Modal';
export default {
  name: "authenticate",
  components: { LoginView, SignUpView, Confirmation, Background, Modal },
  emits: ['exit'],
  data() {
    return {
      login: true,
      afterAuth: false,
    }
  },
  methods: {
    toLogin() {
      this.afterAuth=false
      this.login=true
    }
  }
}
</script>

<style scoped lang="scss">
.autheticate-modal {
  height: 550px;
  width: 825px;
  .modal-tab-group {
    display: grid;
    grid-template-columns: 50% 50%;
    .modal-tab {
      color: #aaa;
      border-bottom: 1px solid #aaa;
      padding: 20px 0px;
      text-align: center;
      font-weight: bold;
      font-size: 20px;
      &:hover {
        cursor: pointer;
      }
    }
    .focus{
      border-bottom: 2px solid rgb(161, 5, 52);
      color: rgb(161, 5, 52);
    }
  }
  .modal-view-group {
    height: 100%;
  }
}
</style>

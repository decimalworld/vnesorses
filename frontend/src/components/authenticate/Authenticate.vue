<template>
<div class="background">
  <div class="modal" v-show="!afterAuth">
    <div class="modal-tab-group">
      <div 
        :class="`modal-tab ${login ? 'focus' : ''}`" 
        @click="login=true">
        <div class="text">Đăng nhập</div>
      </div>
      <div 
        :class="`modal-tab ${login ? '' : 'focus'}`"
        @click="login=false">
        <div class="text">
          Tạo tài khoản
          <div class="close" @click="$emit('exit')">
            <InlineSvg :src="exit" class="icon"></InlineSvg>
          </div>
        </div>
      </div>
    </div>
    <div class="modal-view-group">
      <LoginView v-show="login==true" @exit="$emit('exit')"></LoginView>
      <SignUpView v-show="login==false" @after-auth="afterAuth=true"></SignUpView>
    </div>
  </div>
  <Confirmation 
    @exit="$emit('exit')"
    @confirmed="toLogin" 
    v-if="afterAuth"/>
</div>
</template>

<script>
import { GCLOUD_URL, VUE_APP_ASSETS_DIR } from '@/constants';
import LoginView from './LoginView';
import SignUpView from './SignUpView';
import Confirmation from './Confirmation';
export default {
  name: "authenticate",
  components: { LoginView, SignUpView, Confirmation },
  data() {
    return {
      login: true,
      afterAuth: false,
      exit: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/basic_exit_icon.svg`,
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
.background {
  height: 100%;
  width: 100%;
  background-color: rgba($color: #000000, $alpha: 0.5);
  position: fixed;
  z-index: 2;
  top: 0;
  display: flex;
  .modal {
    margin: 75px auto auto auto;
    height: 550px;
    width: 825px;
    background-color: white;
    display: flex;
    flex-direction: column;
    .modal-tab-group {
      height: 65px;
      display: grid;
      grid-template-columns: 50% 50%;
      .modal-tab {
        position: relative;
        height: 100%;
        width: 100%;
        display: flex;
        color: #aaa;
        border-bottom: 1px solid #aaa;
        .text {
          margin: auto;
          width: 100%;
          font-weight: bold;
          font-size: 20px;
        }
        .close{
          position: absolute;
          right: -15px;
          top: -15px;
          height: 30px;
          width: 30px;
          border-radius: 50%;
          margin: auto;
          background-color: white;
          display: flex;
          &:hover {
            cursor: pointer;
          }
          .icon {
            height: 20px;
            width: auto;
            margin: auto;
          }
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
}
</style>

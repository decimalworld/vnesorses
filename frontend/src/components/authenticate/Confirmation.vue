<template>
  <div class="confirmation">
    <div class="close" @click="$emit('exit')">
      <InlineSvg :src="exit" class="icon"></InlineSvg>
    </div>
    <div class="title">
      Kích hoạt tài khoản
    </div>
    <div class="border"></div>
    <div class="message">
      Đây là demo của VnEsorses, hiện tại trang web không hỗ trợ gửi email cho user, để kích hoạt tài khoản click vào <em @click="activateAccount">đây</em> và đăng nhập
    </div>
  </div>
</template>

<script>
import { GCLOUD_URL, VUE_APP_ASSETS_DIR, VUE_APP_BACKEND_URL } from '@/constants';
import axios from 'axios';
import { mapGetters, mapActions } from 'vuex';

export default {
  name: "confirmation",
  data() {
    return {
      exit: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/basic_exit_icon.svg`
    }
  },
  methods: {
    ...mapGetters(['confirmation']),
    ...mapActions(['toggleLoading']),
    async activateAccount() {
      this.toggleLoading()
      await axios({
        method: 'get',
        url: `${VUE_APP_BACKEND_URL}/users/confirmation?confirmation_token=${this.confirmation()}`
      })
      .then(response => {
        this.$emit('confirmed')
      })
      .catch(err => {
        console.log(err.message)
      })
      .then(this.toggleLoading)
    }
  },
}
</script>

<style scoped lang="scss">
.confirmation{
  position: relative;
  width: 825px;
  height: 320px;
  margin: 75px auto auto auto;
  background: white;
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
  .title{
    font-size: 20px;
    font-weight: bold;
    margin: 20px auto;
  }
  .border{
    margin: auto;
    border-bottom: 1px solid #ccc;
    width: 60%;
  }
  .message{
    margin: 30px auto;
    width: 50%;
    font-size: 18px;
    em {
      font-style: normal;
      text-decoration: underline;
      color: blue;
      &:hover {
        cursor: pointer;
      }
    }
  }
}
</style>

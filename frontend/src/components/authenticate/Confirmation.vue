<template>
  <Modal class="confirmation">
    <div class="title">
      Kích hoạt tài khoản
    </div>
    <Border style="width:60%"/>
    <AuthenFooter class="message">
      Đây là demo của VnEsorses, hiện tại trang web không hỗ trợ gửi email cho user, để kích hoạt tài khoản click vào <em @click="activateAccount">đây</em> và đăng nhập
    </AuthenFooter>
  </Modal>
</template>

<script>
import { GCLOUD_URL, VUE_APP_ASSETS_DIR, VUE_APP_BACKEND_URL } from '@/constants';
import axios from 'axios';
import { mapGetters, mapActions } from 'vuex';
import Border from '../common/Border';
import AuthenFooter from './AuthenFooter';
import Modal from '../common/Modal';
export default {
  name: "confirmation",
  components: { Border, AuthenFooter, Modal },
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
  width: 825px;
  height: 260px;
  .title{
    font-size: 20px;
    font-weight: bold;
    margin: 20px auto;
  }
  .message{
    font-size: 18px;
    color: black;
  }
}
</style>

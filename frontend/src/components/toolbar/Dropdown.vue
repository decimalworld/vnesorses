<template>
  <div class="dropdown">
    <div class="email">
      <InlineSvg :src="userLoggedin" class="icon"></InlineSvg>
      <span>
        {{ truncatedEmail }}
      </span>
    </div>
    <div class="border"></div>
    <div class="option">Thông tin chung</div>
    <div class="option">Ý kiến của bạn</div>
    <div class="option">Tin đã lưu</div>
    <div class="option">Tin đã xem</div>
    <div class="border"></div>
    <div class="option">Thoát</div>
  </div>
</template>

<script>
import { GCLOUD_URL, VUE_APP_ASSETS_DIR } from '@/constants';
import { mapGetters } from 'vuex';

export default {
  name: "dropdown",
  data(){
    return {
      userLoggedin: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/user_loggedin_icon.svg`,
    }
  }, 
  computed: {
    ...mapGetters(["user"]),
    truncatedEmail() {
      return this.user.email.match(/^[^@]*/)[0]
    }
  }
}
</script>

<style scoped lang="scss">
.dropdown {
  position: relative;
  z-index: 2;
  top: 55px;
  left: -130px;
  height: 365px;
  width: 275px;
  border-radius: 2%;
  position: absolute;
  background: white;
  color: black;
  cursor: default;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.6), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  display: flex;
  flex-direction: column;
  .email {
    height: 80px;
    display: flex;
    width: 100%;
    margin-top: 5px;
    .icon {
      margin: auto 15px;
      height: 60px;
      width: 60px;
    }
    span {
      margin: auto auto auto 5px;
      width: auto;
      font-size: 20px;
    }
  }
  .border {
    width: 80%;
    margin: 5px auto 5px auto;
    border-bottom: 1px solid #aaa;
  }
  .option {
    position: relative;
    display: flex;
    width: 100%;
    margin: 15px 25px;
    font-size: 17px;
    &:hover{
      cursor: pointer;
    }
  }
}
</style>

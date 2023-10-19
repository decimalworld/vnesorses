<template>
  <div class="dropdown">
    <div class="email">
      <img :src="user.avatar_link" class="icon"/>
      <span>
        {{ truncatedEmail }}
      </span>
    </div>
    <div class="border"></div>
    <ClickableTitle 
      text="Thông tin chung" 
      class="option"
      @click="helpers.goToProfile"
    />
    <ClickableTitle text="Ý kiến của bạn" class="option"/>
    <ClickableTitle text="Tin đã lưu" class="option"/>
    <ClickableTitle text="Tin đã xem" class="option"/>
    <div class="border"></div>
    <ClickableTitle text="Thoát" class="option"/>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
import ClickableTitle from '../common/ClickableTitle.vue';

export default {
  name: "dropdown",
  inject: ["helpers"],
  components: { ClickableTitle },
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
  z-index: 3;
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

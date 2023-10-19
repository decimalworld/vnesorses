<template>
<div>
  <div class="profile-container">
    <div class="nav-wrapper">
      <div class="nav-box">
        <div class="email-box-wrapper">
          <div class="email-box">
            <img :src="profile.avatar.full_path" class="icon"/>
            <div class="email">
              <p>{{ profile.account_name }}</p>
              <p>{{ Date.now() }}</p>
            </div>
          </div>
        </div>
        <Border direction="bottom" style="width:85%"></Border>
        <UserNavigatable/>
      </div>
    </div>
    <div class="info-box">

    </div>
  </div>
</div>
</template>

<script>
import { mapGetters } from 'vuex';
import Border from '@/components/common/Border.vue';
import UserNavigatable from '@/components/user/UserNavigatable';
export default {
  name: "userProfileView",
  components: { Border, UserNavigatable },
  data() {
    return {
      profile: null
      // profile: {
      //   account_name: "leminhquan8101998",
      //   avatar: {
      //     full_path: "https://storage.googleapis.com/vnesorses.appspot.com/avatars/fba71a88-f890-4300-8ade-e413cd545bc7"
      //   }
      // }
    }
  },
  beforeMount() {
    this.profile = this.$store.getters.profile
  }
}
</script>

<style scoped lang="scss">
  .profile-container {
    height: auto;
    margin: 40px 160px;
    display: flex;
    justify-content: space-between;
    .nav-wrapper {
      height: inherit;
      overflow: visible;
      .nav-box{
        z-index: 0;
        top: 80px;
        width: 330px;
        height: 420px;
        border: 1px solid #ccc;
        position: sticky;
        display: flex;
        flex-direction: column;
        .email-box-wrapper {
          height: auto;
          display: flex;
          margin: 15px 0px;
          justify-content: space-around;
          .email-box {
            margin: auto 20px;
            height: auto;
            width: 100%;
            display: flex;
            justify-content: space-between;
            .icon {
              height: 80px;
              margin: 5px 0px;
              width: auto;
            }
            .email {
              margin: auto;
              p {
                margin: 5px 0px;
                font-size: 20px;
                align-items: start;
                display: flex;
              }
              :first-child {
                font-weight: bold;
              }
            }
          }
        }
      }
    }
    .info-box{
      height: 1000px;
      width: 710px;
      background-color: green;
    }
  }
</style>

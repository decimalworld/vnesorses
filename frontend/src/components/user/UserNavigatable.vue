<template>
  <div class="nav-wrapper">
    <div class="nav-box">
      <div class="email-box-wrapper">
        <div class="email-box">
          <div class="avatar-wrapper">
            <img :src="profile.avatar.full_path" class="avatar"/>
          </div>
          <div class="email">
            <p>{{ profile.account_name }}</p>
            <p>{{ `Tham gia từ ${parseDate(profile.created_at)}` }}</p>
          </div>
        </div>
      </div>
      <Border direction="bottom" style="width:85%"></Border>
      <div class="navigate-group">
        <div :class="this.$route.name=='userProfile' ? 'disable' : 'navigate'">Thông tin chung</div>
        <div class="navigate">Ý kiến của bạn</div>
        <div class="navigate">Tin đã lưu</div>
        <div class="navigate">Tin đã xem</div>
        <div class="navigate">Thoát</div>
      </div>
    </div>
  </div>
</template>

<script>
import moment from 'moment';
import Border from '../common/Border.vue';
export default {
  name: "userNavigatable",
  components: { Border },
  data() {
    return {
      profile: this.$store.getters.profile,
    }
  },
  methods: {
    parseDate(date){
      return moment(date).format('M/YYYY')
    }
  }
}
</script>

<style scoped lang="scss">
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
            gap: 15px;
            .avatar-wrapper{

              height: 80px;
              width: 80px;
              margin: 5px 0px;
              border-radius: 50%;
              overflow: hidden;
              .avatar {
                height: inherit;
                width: inherit;
              }
            }
            .email {
              margin: auto 0px;
              p {
                margin: 5px 0px;
                font-size: 16px;
                align-items: start;
                display: flex;
              }
              :first-child {
                font-size: 20px;
                font-weight: bold;
              }
            }
          }
        }
        .navigate-group {
          flex-grow: 1;
          display: flex;
          flex-direction: column;
          justify-content: space-around;
          width: 100%;
          margin: 0px 25px;
          text-align: start;
          font-size: 20px;
          .navigate {
            &:hover{
              cursor: pointer;
              color: rgb(255, 0, 76);
            }
          }
          .disable {
            font-weight: bold;
          }
        }
      }
    }
</style>

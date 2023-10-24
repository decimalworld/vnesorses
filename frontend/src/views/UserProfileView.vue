<template>
<div>
  <div class="profile-container">
    <UserNavigatable/>
    <div class="info-box">
      <div class="title">Thông tin tài khoản</div>
      <div class="info-group" :key="infoGroupKey">
        <AvatarField :avatar="profile?.avatar"/>
        <Border direction="bottom"/>
        <UserProfileField label="Họ tên" :value="profile.name">
          <div class="info-change">
            <div class="data-group">
              <div class="label">Nhập họ tên</div>
              <input type="text" placeholder="Nhập họ tên" v-model="changed.name">
            </div>
            <div class="button-group">
              <div 
                class="button" 
                :style="nameChanged ? 'background-color: rgb(161, 5, 52); color:#fff': 'background-color: #eee;'"
                @click="nameChanged && updateData()"
              >
                <span>Đổi tên</span>
              </div>
            </div>
          </div>
        </UserProfileField>
        <Border direction="bottom"/>
        <UserProfileField label="Email" :value="profile.email">
          <div class="info-change">
            <div class="data-group">
              <div class="label">Nhập mật khẩu hiện tại</div>
              <input type="password" placeholder="Nhập mật khẩu" v-model="changed.password_confirmation">
            </div>
            <div class="data-group">
              <div class="label">Nhập email mới</div>
              <input type="text" placeholder="Nhập email mới" v-model="changed.email">
            </div>
            <div class="button-group">
              <div 
                class="button" 
                :style="emailChanged ? 'background-color: rgb(161, 5, 52); color:#fff': 'background-color: #eee;'"
                @click="emailChanged && updateData()"
              >
                <span>Đổi email</span>
              </div>
            </div>
          </div>
        </UserProfileField>
      </div>
    </div>
  </div>
</div>
</template>

<script>
import Border from '@/components/common/Border.vue';
import AvatarField from '@/components/user/AvatarField.vue';
import UserNavigatable from '@/components/user/UserNavigatable';
import UserProfileField from '@/components/user/UserProfileField.vue';
import { mapActions } from 'vuex';
export default {
  name: "userProfileView",
  inject: ["helpers"],
  components: { Border, UserNavigatable, AvatarField, UserProfileField, Border, UserProfileField },
  data() {
    return {
      profile: null,
      newAvatarUrl: null,
      avatarChange: false,
      newAvatar: null,
      haveNewAvatar: false,
      infoGroupKey: 0,
      changed: {
        name: '',
        email: '',
        password_confirmation: ''
      },
    }
  },
  computed: {
    profile: {
      get() {
        return this.$store.getters.profile
      },
      set(value) {
        this.setProfile(value)
      }
    },
    nameChanged: {
      get() {
        return this.changed.name.length !==0
      }
    },
    emailChanged: {
      get() {
        return this.changed.email.length !==0
      }
    }
  },
  methods: {
    ...mapActions(['setProfile', 'toggleLoading']),
    async updateData() {
      this.toggleLoading();
      const data = Object.keys(this.changed).reduce((acc, key) => {
        if (this.changed[key].length !==0) {
          acc[key] = this.changed[key]
        }
        return acc;
      }, {})
      const token = this.$store.getters.token;
      const newProfile = await this.helpers.updateProfile(token, data).then(res => res.data.user_profile)
      this.setProfile(newProfile);
      this.infoGroupKey += 1;
      this.changed = {
        name: '',
        email: '',
        password_confirmation: '',

      }
      this.toggleLoading();
    }
  },
  beforeMount() {
    const profile = this.$store.getters.profile
    this.newAvatarUrl = profile.avatar.full_path
  }
}
</script>

<style scoped lang="scss">
  .profile-container {
    height: auto;
    margin: 40px 160px;
    display: flex;
    justify-content: space-between;
    .info-box{
      height: 1000px;
      width: 710px;
      .title {
        text-align: start;
        font-size: 28px;
        font-weight: bold;
      }
      .info-group {
        display: flex;
        flex-direction: column;
        height: auto;
        margin: 35px 0px;
        gap: 35px;
        .info-change {
          background-color: #f6f6f6;
          height: auto;
          width: inherit;
          display: flex;
          flex-direction: column;
          border-radius: 5px;
          padding: 20px;
          gap: 30px;
          .data-group {
            gap: 10px;
            display: flex;
            flex-direction: column;
            color: black;
            input {
              font-size: 20px;
              height: 60px;
              border: solid 1px #eee;
              border-radius: 5px;
              padding: 0px 15px;
              box-sizing: border-box;
            }
          }
          .button-group {
            display: flex;
            .button{
              height: 55px;
              width: 100px;
              display: flex;
              border-radius: 5px;
              &:hover{
                cursor: pointer;
              }
              span {
                margin: auto;
              }
            }
          }
        }
      }
    }
  }
</style>

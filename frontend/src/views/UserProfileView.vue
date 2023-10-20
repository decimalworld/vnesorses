<template>
<div>
  <div class="profile-container">
    <UserNavigatable/>
    <div class="info-box">
      <div class="title">Thông tin tài khoản</div>
      <div class="info-group">
        <div class="header-group">
          <div class="field">Ảnh đại diện</div>
          <div class="link" @click="toggleAvatarChange">{{ avatarChange ? 'Đóng' : 'Thay đổi' }}</div>
        </div>
        <div class="content-group">
          <template v-if="avatarChange">
            <div class="avatar-change">
              <div class="avatar-wrapper">
                <img :src="newAvatarUrl" class="avatar"/>
              </div>
              <div class="btn-group">
                <label
                  for="blog-photo" 
                  class="button"
                  style="
                    border: 1px solid #aaa"
                >
                  <span>
                    Chọn lại ảnh
                  </span>
                </label>
                <div 
                  class="button" 
                  style="
                    background-color: rgb(164, 9, 40);
                    color: #fff"
                  @click="haveNewAvatar && updateAvatar()"
                >
                  <span>
                    Lưu thay đổi
                  </span>
                </div>
                <input type="file" id="blog-photo" ref="blogPhoto" accept=".png, .jpg, .jpeg" @change="fileChange">
              </div>
            </div>
          </template>
          <template v-else>
            <div class="avatar-wrapper">
              <img :src="profile.avatar.full_path" class="avatar"/>
            </div>
          </template>
        </div>
      </div>
      <Border direction="bottom"/>
    </div>
  </div>
</div>
</template>

<script>
import Border from '@/components/common/Border.vue';
import UserNavigatable from '@/components/user/UserNavigatable';
import reducer from 'image-blob-reduce';
export default {
  name: "userProfileView",
  inject: ["helpers"],
  components: { Border, UserNavigatable },
  data() {
    return {
      profile: null,
      newAvatarUrl: null,
      avatarChange: false,
      newAvatar: null,
      haveNewAvatar: false,
      // newAvatarUrl: "https://storage.googleapis.com/vnesorses.appspot.com/avatars/fba71a88-f890-4300-8ade-e413cd545bc7",
      // profile: {
      //   account_name: "leminhquan8101998",
      //   avatar: {
      //     full_path: "https://storage.googleapis.com/vnesorses.appspot.com/avatars/fba71a88-f890-4300-8ade-e413cd545bc7"
      //   }
      // }
    }
  },
  methods: {
    toggleAvatarChange() {
      this.avatarChange = !this.avatarChange
    },
    fileChange() {
      this.newAvatar = this.$refs.blogPhoto.files[0];
      this.haveNewAvatar = true;
      this.newAvatarUrl = URL.createObjectURL(this.newAvatar);
    },
    async updateAvatar() {
      this.$store.dispatch('toggleLoading');
      const profile = await this.helpers.changeAvatar(this.$store.getters.token).then(res => res.data.user_profile);

      this.helpers.uploadImage(this.newAvatar, profile.avatar.signed_url)
      .then(() => { 
        this.profile = profile;
        return new Promise(r => setTimeout(r, 500))
      })
      .then(() => {
        this.toggleAvatarChange();
        this.haveNewAvatar = false;
        this.$store.dispatch('toggleLoading');
      })
    },
  },
  beforeMount() {
    this.profile = this.$store.getters.profile
    this.newAvatarUrl = this.profile.avatar.full_path
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
        .header-group {
          display: flex;
          justify-content: space-between;
          font-size: 20px;
          height: 40px;
          .link {
            color: #aaa;
            text-decoration: underline;
            &:hover{
              cursor: pointer;
            }
          }
        }
        .content-group{
          flex-grow: 1;
          display: flex;
          height: auto;
          .avatar-wrapper{
            height: 40px;
            width: 40px;
            margin: auto 0px;
            border-radius: 50%;
            overflow: hidden;
            .avatar {
              height: inherit;
              width: inherit;
            }
          }
          .avatar-change {
            height: 225px;
            width: 100%;
            background-color: #f6f6f6;
            border: 1px dotted #ccc;
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            .avatar-wrapper{
              height: 80px;
              width: 80px;
              margin: 0px auto;
              border-radius: 50%;
              overflow: hidden;
              .avatar {
                height: inherit;
                width: inherit;
              }
            }
            .btn-group{
              height: 60px;
              display: flex;
              margin: 0 auto;
              gap: 20px;
              .button {
                width: 200px;
                display: flex;
                background-color: #fff;
                border-radius: 5px;
                &:hover {
                  cursor: pointer;
                }
                span {
                  margin: auto;
                  font-size: 20px;
                }
              }
            }
            input {
              display: none
            }
          }
        }
      }
    }
  }
</style>

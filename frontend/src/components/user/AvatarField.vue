<template>
  <div class="avatar-group">
    <div class="group-label">
      <div class="field">Ảnh đại diện</div>
      <div class="link" @click="toggleAvatarChange">{{ avatarChange ? 'Đóng' : 'Thay ảnh đại diện' }}</div>
    </div>
    <div class="group-content">
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
          <img :src="oldAvatarUrl" class="avatar"/>
        </div>
      </template>
    </div>
  </div>
</template>

<script>
export default {
  name: "avatarField",
  inject: ["helpers"],
  data() {
    return {
      haveNewAvatar: false,
      newAvatar: null,
      newAvatarUrl: this.avatar.full_path,
      oldAvatarUrl: this.avatar.full_path,
      avatarChange: false,
    }
  },
  props: {
    avatar: Object
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
        this.oldAvatarUrl = profile.avatar.full_path;
        this.newAvatarUrl = profile.avatar.full_path;
        return new Promise(r => setTimeout(r, 500))
      })
      .then(() => {
        this.toggleAvatarChange();
        this.haveNewAvatar = false;
        this.$store.dispatch('toggleLoading');
      })
    },
  }
}
</script>

<style scoped lang="scss">
.avatar-group {
  .group-label {
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
  .group-content{
    flex-grow: 1;
    display: flex;
    height: auto;
    flex-direction: column;
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
</style>

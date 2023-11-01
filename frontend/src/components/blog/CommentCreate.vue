<template>
<div class="comment-create-group">
  <textarea
    class="comment-input"
    placeholder="Chia sẻ ý kiến của bạn"
    :rows=" focusInput ? 3 : 1"
    v-model="comment.content"
    @focus="focusInput=true"
    @input="validateComment"
    />
  <div class="comment-error">
    {{ this.commentError }}
  </div>
  <div class="comment-button">
    <div class="user-name-group" v-if="profile.avatar">
      <Avatar :src="profile.avatar.full_path" class="avatar"/>
      <div class="username">
        {{ profile.account_name }}
      </div>
    </div>
    <CustomButton class="button" @click="submitComment">
      Gửi
    </CustomButton>
  </div>
</div>
</template>

<script>
import Avatar from '../common/Avatar.vue';
import CustomButton from '../common/CustomButton.vue';
export default {
  name: "commentCreate",
  components: { Avatar, CustomButton },
  inject: ["helpers"],
  data() {
    return {
      comment: {
        content: "",
        blog_id: this.$route.params.id
      },
      commentError: "",
      focusInput: false,
      profile: this.$store.state.session.profile,
    }
  },
  methods: {
    validateComment() {
      if (this.comment.length === 0) {
        this.commentError = 'Bạn chưa nhập nội dung bình luận'
      } else {
        this.commentError = ''
      }
    },
    async submitComment() {
      const token=this.$store.getters.token;

      if (this.comment.length === 0) {
        this.commentError = 'Bạn chưa nhập nội dung bình luận'
        return
      } 
      if (!token) {
        this.commentError = 'Đăng nhập để đăng bình luận'
        return
      } 

      this.helpers
      .postComment(token, this.comment)
      .then(() => this.$router.go(0))
    }
  }
}
</script>

<style scoped lang="scss">
.comment-create-group {
      .comment-input{
        width: 100%;
        font-size: 20px;
        padding: 20px;
        margin: 5px 0px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-left: 2px solid rgb(161, 5, 52);
        background-color: #eee;
        border-radius: 10px;
        &:focus{
          outline: none;
          border: 1px solid #ccc;
          border-left: 2px solid rgb(161, 5, 52);
        }
      }
      .comment-error{
        color: red;
        text-align: left;
      }
      .comment-button {
        display: flex;
        justify-content: flex-end;
        width: 100%;
        height: auto;
        .button {
          width: 135px;
          margin: 0px;
          color: white;
          background-color: rgb(161, 5, 52);
        }
        .user-name-group{
          display: flex;
          margin: auto 0px;
          .avatar{
            height: 40px;
            width: 40px;
          }
          .username{
            margin: auto 20px;
            font-size: 18px;
            font-weight: bold;
          }
        }
      }
    }
</style>

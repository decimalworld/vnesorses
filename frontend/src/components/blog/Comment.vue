<template>
  <div class="comment" v-if="comment">
    <Avatar :src="comment.user.avatar" class="avatar"/>
    <div class="content-group">
      <div class="text-group">
        <a>{{ comment.user.username }}</a>
        {{ comment.content }} 
      </div>
      <div class="button-group">
        <CustomButton class="button" @click="toggleLike">
          <div :class="`button-content ${comment.like === true ? 'liked' : ''}`" >
            <CustomIcon src="like_icon.svg" class="icon"/>
            Thích
          </div>
        </CustomButton>
        <CustomButton class="button">
          <Tooltip class="tooltip" v-if="!(this.token || false)">
            {{ tooltip }}
          </Tooltip>
          <div class="button-content">
            Trả lời
          </div>
        </CustomButton>
      </div>
    </div>
  </div>
</template>

<script>
import Avatar from '../common/Avatar.vue';
import CustomButton from '../common/CustomButton.vue';
import CustomIcon from '../common/CustomIcon.vue';
import Tooltip from '../common/Tooltip.vue';
export default {
  name: "comment",
  inject: ["helpers"],
  components: { Avatar, CustomButton, CustomIcon, Tooltip },
  methods: {
    async like(){
    },
    toggleLike() {
      this.$emit('like-toggle');
    }
  },
  props: {
    comment: Object,
  },
  emits: ['like-toggle'],
  data() {
    return {
      tooltip: "Đăng nhập để bình luận",
      token: null,
    }
  },
  beforeMount() {
    this.token = this.$store.getters.token;
  }
}
</script>

<style scoped lang="scss">
.comment {
  display: flex;
  width: 100%;
  justify-content: space-between;
  .avatar {
    height: 50px;
    width: 50px;
    &:hover{
      cursor: pointer;
    }
  }
  .content-group {
    .text-group {
      width: 850px;
      padding: 10px 5px;
      font-size: 18px;
      text-align: start;
      word-wrap: break-word;
      a {
        font-weight: bold;
        &:hover{
          color: blue;
          cursor: pointer;
        }
      }
    }
    .button-group {
      display: flex;
      height: auto;
      gap: 20px;
      position: relative;
      .button {
        width: auto;
        margin: 0px;
        padding: 5px 0px;
        gap: 5px;
        .button-content{
          display: flex;
          justify-content: space-between;
          .icon {
            margin: auto 0px;
            position: static;
            width: 20px;
            height: 20px;
          }
        }

        .liked {
          color: red;
        }
        &:hover{
          .tooltip{
            visibility: visible;
          }
        }
      }
    }
  }
}
</style>

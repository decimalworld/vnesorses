<template>
  <div class="comment-view">
    <div class="comment-section">
      <div class="title">
        Ý kiến
      </div>
      <CommentCreate/>
      <div class="comment-display-group">
        <div class="comment-tab-group">
          <div 
            :class="`tab ${focusTab===0 ? 'focus' : ''}`"
            @click="changeToMostPopular"
            >
            Quan tâm nhất
          </div>
          <div 
            :class="`tab ${focusTab===1 ? 'focus' : ''}`"
            @click="changeToLatest"
            >
            Mới nhất
          </div>
        </div>
        <Border direction="bottom"/>
        <div class="comment-group" :key="focusTab">
          <Comment 
            v-for="(comment, index) in existedComment"
            :comment="comment"
            :key="index"
            @like-toggle="likeToggle(index)"
            />
        </div>
      </div>
    </div>
    <Border direction="left" class="border"/>
    <div class="ads"></div>
  </div>
</template>

<script>
import Border from '../common/Border.vue';
import Avatar from '../common/Avatar.vue';
import CustomButton from '../common/CustomButton';
import CommentCreate from './CommentCreate.vue';
import Comment from './Comment.vue';

export default {
  name: "commentSection",
  inject: ["helpers"],
  components: { Border, CustomButton, Avatar, CommentCreate, Comment },
  data() {
    return {
      existedComment: [],
      focusTab: 0,
    }
  },
  methods: {
    async changeToLatest() {
      await this.updateLike()
      await this.helpers
      .getComment(this.$route.params.id, { order: "latest" })
      .then(res => {
        this.existedComment = res.data.comments
        this.focusTab = 1
      });
    },
    async changeToMostPopular() {
      await this.updateLike()
      await this.helpers
      .getComment(this.$route.params.id, { order: "popular" })
      .then(res => {
        this.existedComment = res.data.comments
        this.focusTab = 0
      });
    },
    likeToggle(index) {
      this.existedComment[index].like = !this.existedComment[index].like
    },
    async updateLike() {
      if (Boolean(this.$store.getters.ip)) {
        this.helpers.updateComments(this.$route.params.id, { comments: this.existedComment} )
      }
      return undefined
    },
  },
  created() {
    window.onbeforeunload=this.updateLike
  },  
  async beforeMount() {
    this.changeToMostPopular()
  },
  async beforeUnmount() {
    this.updateLike()
  }
}
</script>

<style scoped lang="scss">
.comment-view {
  display: flex;
  height: auto;
  width: 100%;
  .comment-section{
    width: 920px;
    padding: 20px 15px;
    display: flex;
    flex-direction: column;
    height: auto;
    gap: 15px;
    .title {
      text-align: start;
      font-size: 26px;
    }
    .comment-display-group {
      .comment-tab-group{
        display: flex;
        .tab {
          padding: 15px 20px;
          font-size: 20px;
          color: #aaa;
          &:hover {
            cursor: pointer;
          }
        }
        .focus {
          border-bottom: 1px solid rgb(161, 5, 52);
          color: rgb(161, 5, 52);
        }
      }
      .comment-group {
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
        }
      }
    }
  }
  .border {
    height: inherit;
    margin: 15px 10px;
  }
  .ads {
    background-color: aqua;
    height: inherit;
    flex-grow: 1;
  }
}
</style>

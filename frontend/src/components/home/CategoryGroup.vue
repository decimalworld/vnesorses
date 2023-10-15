<template>
<div class="category-group">
  <div class="tag-link-group">
    <ClickableTitle
      class="category-link"
      text="Kinh doanh"
    />
    <ClickableTitle
      class="tag-link"
      text="Quốc tế"
    />
    <ClickableTitle
      class="tag-link"
      text="Doanh nghiệp"
    />
    <ClickableTitle
      class="tag-link"
      text="Chứng khoán"
    />
    <ClickableTitle
      class="tag-link"
      text="Vĩ mô"
    />
    <ClickableTitle
      class="tag-link"
      text="Hậu trường kinh doanh"
    />
  </div>
  <div class="tag-latest-news" v-if="ready">
    <div class="latest-container">
      <div class="latest">
        <img :src="blog.cover.full_path" class="image"/>
        <div class="content">
          <ClickableTitle :text="blog.title"/>
          <div class="summary" v-html="blog.summary">
          </div>
        </div>
      </div>
      <Border
        direction="left"
      />
    </div>
    <Border direction="bottom"/>
  </div>
</div>
</template>

<script>
import { defineAsyncComponent } from 'vue';
import ClickableTitle from '../common/ClickableTitle.vue';
import Border from '../common/Border.vue';
import { VUE_APP_BACKEND_URL } from '@/constants';
import axios from 'axios';
const AsyncCard = defineAsyncComponent({
  loader: () => import('../Card.vue')
})
export default {
  name: "categoryGroup",
  components: { ClickableTitle, AsyncCard, Border },
  data() {
    return {
      ready: null,
      blog: {
        title: "Phim Đất rừng phương Nam bị chỉ trích 'làm sai lệch lịch sử'",
        summary: "Nhà sản xuất \"Đất rừng phương Nam\" đề xuất lên Cục Điện ảnh được đổi tên các bang phái trong phim sau khi tác phẩm bị chỉ trích \"nâng tầm Thiên Địa hội\".",
        cover: {
          full_path: "https://storage.googleapis.com/vnesorses.appspot.com/covers/dd5f72bf-a8ea-4f5d-9118-dd479abef9e5"
        }
      }
    }
  },
  async beforeMount() {
    await axios({
      method: 'get',
      url: `${VUE_APP_BACKEND_URL}/blogs/spotlights`
    })
    .then(response => {
      console.log(response)
      this.blog = response.data.blog
      this.ready = true
    })
    .catch(err => {
      console.clear()
      console.log(err.response.data.error_message)
    })
  }
}
</script>

<style scoped lang="scss">
.category-group {
  margin: 15px 15px;
  padding: 0px 5px;
  height: 350px;
  width: 100%;
  .tag-link-group {
    display: flex;
    height: 30px;
    .category-link{
      font-size: 22px;
      padding: 2px 0px;
      margin-right: 5px;
      border-bottom: 1px solid rgb(197, 4, 62);
      position: relative;
      bottom: 0;
    }
    .tag-link{
      margin: 0px 10px;
      font-size: 15px;
      display: flex;
      font-weight: normal !important;
    }
    :deep(span){
      margin-top: auto;
      margin-bottom: 5px;
    }
  }
  .tag-latest-news{
    height: auto;
    .latest-container {
      display: grid;
      grid-template-columns: 520px 0px auto;
      height: 180px;
      padding: 5px 0;
      .latest {
        height: 100%;
        width: auto;
        display: grid;
        grid-template-columns: 250px auto;
        .image {
          height: 85%;
          width: 100%;
          margin: auto 0px;
        }
        .content {
          height: 85%;
          margin: auto 20px;
          .summary {
            height: auto;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 4;
            width: 100%;
            text-align: start;
            font-size: 16px;
            margin: 10px 2px;
            overflow: clip;
            text-overflow: ellipsis;
            :deep(p) {
              margin: auto;
            }
          }
        }
      }
    }
  }
}
</style>

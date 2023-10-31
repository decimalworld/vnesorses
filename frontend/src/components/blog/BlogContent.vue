<template>
  <div class="content">
    <div class="meta">
      <div class="tag">
        {{ blog.tag.category_name }}  
        <template v-if="blog.tag.tag_name">
          <CustomIcon src="right_arrow_icon.svg" style="position:static"/>
          {{ blog.tag.tag_name }}
        </template>
      </div>
      <div class="date">
        {{ blog.created_at }}
      </div>
    </div>
    <div class="title">{{  blog.title }}</div>
    <div class="body" v-html="blog.body"></div>
  </div>
</template>

<script>
import CustomIcon from '@/components/common/CustomIcon';

export default {
  name: 'blogContent',
  components: { CustomIcon },
  props: {
    blog: Object
  }
}
</script>

<style scoped lang="scss">
.content {
  width: 100%;
  display: flex;
  flex-direction: column;
  margin: 0px 10px;
  .meta {
    height: 60px;
    display: flex;
    justify-content: space-between;
    width: 100%;
    div {
      display: flex;
      padding: 21px 0px;
      font-size: 18px;
      position: relative;
      .icon {
        position: static;
      }
    }
  }
  .title {
    font-size: 32px;
    font-weight: bold;
    text-align: left;
  }
  .body {
    width: 100%;
    margin: 30px 0px;
    font-size: 18px;
    text-align: left;
    line-height: 30px;
    
    :deep(img) {
      width: 100%;
      height: auto;
      object-fit:contain;
    }
  }
}
</style>

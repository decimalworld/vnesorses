<template>
  <div>
    <div class="media">
      <div class="media-type">
        <div v-for="(medium, index) in media" :key="index">
          <div class="text">
            {{ medium }}
          </div>
        </div>
      </div>
      <div class="media-focal">
        <div v-for="(focal, index) in focals" :key="index">
          <div class="text">
            {{ focal }}
          </div>
        </div>
      </div>
    </div>
    <div class="categories">
      <div v-for="(category, index) in categories" :key="index" class="category">
        <div class="text">
          {{ category }}
        </div>
      </div>
    </div>
    <div class="externals">
        <div class="content">
        <div v-for="(external, index) in externals" :key="index" class="external">
          <div class="text">
            {{ external }}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Navigation",
  data() {
    return {
      media: [
        'Trang chủ',
        'Video',
        'Podcasts',
        'Ảnh',
        'Infographics',
      ],
      focals: [
        'Mới nhất',
        'Xem nhiều',
        'Tin nóng',
      ],
      categories: [
        'Thời sự',
        'Góc nhìn ',
        'Thế giới',
        'Kinh doanh',
        'Bất động sản',
        'Giải trí',
        'Thể thao',
        'Pháp luật',
        'Giáo dục',
        'Sức khỏe',
        'Đời sống',
        'Du lịch',
        'Khoa học',
        'Số hóa',
        'Xe',
        'Ý kiến',
        'Tâm sự',
        'Thư giãn',
      ],
      externals: [
        'Rao vặt',
        'Startup',
        'Mua ảnh VnExpress',
        'eBox',
      ]
    }
  }
}
</script>

<style lang="scss" scoped>
.text {
  margin: auto 0;
  font-size: 14px;
  text-align: start;
}
.media {
  display: grid;
  height: 100%;
  width: auto;
  margin-right: 10px;
  grid-template-rows: repeat(8, 1fr);
  font-weight: bold; 
  .media-type {
    grid-row: span 5;
    display: grid;
    padding-bottom: 7px;
    border-bottom: 1px solid #eee;
  }
  div {
    height: auto;
    width: 100%;
    display: flex;
  }
  .media-focal{
    padding-top: 7px;
    grid-row: span 3;
    display: grid;
  }
}
.categories {
  display: grid;
  width: 100%;
  height: 72%;
  padding: 0 10px;
  grid-column: 2 / span 3;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: repeat(6, 1fr);
  grid-auto-flow: column;
  .category {
    margin-left: 4px;
    display: grid;
  }
}
.externals {
  border-left: 1px solid #eee;
  border-right: 2px solid #eee;
  padding: 0 10px;
  margin-right: 2px;
  height: 100%;
  .content {
    height: 50%;
    display: grid;
    grid-template-rows: repeat(4, 1fr);
    .external {
      margin: auto 0;
    }
  }
}
</style>

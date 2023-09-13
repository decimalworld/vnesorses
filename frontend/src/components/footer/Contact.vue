<template>
  <div>
    <div class="download">
      <div class="title">
        <div class="text">
          Tải ứng dụng
        </div>
      </div>
      <div class="btn-group">
        <div class="btn">
          <div class="text">
            button 1
          </div>
        </div>
        <div class="btn">
          <div class="text">
            button 2
          </div>
        </div>
      </div>
    </div>
    <div class="link">
      <div class="title">
        <div class="text">
          Liên hệ
        </div>
      </div>
      <div class="content">
          <div class="top-link">
            <img :src="this.icon" class="icon">
            <div class="text">
              Tòa soạn
            </div>
          </div>
          <div class="top-link">
            <img :src="this.icon" class="icon">
            <div class="text">
              Quảng cáo
            </div>
          </div>
          <div class="bottom-link">
            <img :src="this.icon" class="icon">
            <div class="text">
              Hợp tác bản quyền
            </div>
          </div>
      </div>
      <div class="content">

      </div>
    </div>
  </div>
</template>

<script>
import { GCLOUD_URL } from '@/constants'
export default {
  name: "Contact",
  data() {
    return {
      icon: `${ GCLOUD_URL }/${process.env.VUE_APP_ASSETS_DIR}/base_bash_icon.svg`
    }
  }
}
</script>

<style lang="scss" scoped>
.title {
  display: flex;
}
.text {
  margin: auto 0;
  font-size: 14px;
}
.download {
  width: 100%;
  height: 25%;
  .title {
    height: 50%;
  }
  .btn-group {
    display: flex;
    height: 50%;
    width: 100%;
    .btn {
      margin: auto 5px;
      height: 100%;
      width: 100%;
      background-color: #eee;
      border-radius: 5%;
      display: flex;
      &:hover {
        background-color: #ddd;
        cursor: pointer;
      }
    }
  }
}
.link {
  width: 100%;
  height: 30%;
  .title {
    height: 31.25%;
  }
  .content {
    height: 68.75%;
    width: 100%;
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    grid-template-rows: repeat(2, 1fr);
    .icon {
      margin: auto 0;
      height: 20px;
      width: auto;
    };
    div {
      &:hover {
        color: blue;
        cursor: pointer;
      }
    }
    .top-link {
      height: 100%;
      display: flex;
    }
    .bottom-link {
      height: 100%;
      grid-column: span 2;
      display: flex
    }
  }
}
</style>

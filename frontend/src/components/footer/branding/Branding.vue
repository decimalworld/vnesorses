<template>  
  <div class="branding">
    <div class="top">
      <div class="name">
        <span>Báo điện tử</span>
        <InlineSvg :src="brandName" class="icon"/>
      </div>
      <div class="social">
        <div class="text">Điều khoản sử dụng</div>
        <div class="text">RSS</div>
        <div>
          <span class="text">Theo dõi VnEsOrsEs trên</span>
          <InlineSvg :src="github" class="icon"/>
          <InlineSvg :src="email" class="icon"/>
          <InlineSvg :src="linkedin" class="icon"/>
        </div>
      </div>
    </div>
    <div class="bottom">
      <License1 class="column"/>
      <License2 class="column"/>
      <License3 class="column"/>
    </div>
  </div>
</template>

<script>
import { GCLOUD_URL } from '@/constants';
import License1 from './License1.vue';
import License2 from './License2.vue';
import License3 from './License3.vue';
export default {
  name: "Branding",
  components: { 
    License1,
    License2,
    License3
  },
  data() {
    return {
      brandName: `${GCLOUD_URL}/${process.env.VUE_APP_ASSETS_DIR}/brand_name_icon.svg`,
      github: `${GCLOUD_URL}/${process.env.VUE_APP_ASSETS_DIR}/github_icon.svg`,
      email: `${GCLOUD_URL}/${process.env.VUE_APP_ASSETS_DIR}/email_icon.svg`,
      linkedin: `${GCLOUD_URL}/${process.env.VUE_APP_ASSETS_DIR}/linkedin_icon.svg`,
    }
  }
}
</script>

<style lang="scss" scoped>
.branding {
  border-top: 1px solid #bbb;
  .top {
    height: 50px;
    display: flex;
    border-bottom: 1px solid #ddd;
    .name {
      margin: auto 0;
      justify-content: start;
      display: flex;
      width: 150px;
      span {
        margin: auto;
        padding-right: 6px;
        font-size: 14px;
      }
      .icon {
        height: 50px;
        width: auto;
      }
    }
    .social {
      margin: auto 0;
      justify-content: end;
      display: flex;
      width: 100%;
      .text {
        font-size: 14px;
        color: #888;
        margin: auto 0;
      }
      .icon {
        height: 30px;
        width: auto;
        fill: #666;
        padding: 5px;
      }
      div {
        border-right: 1px solid #ddd;
        display: flex;
        padding: 0 10px;
        &:last-child {
          border: none;
          padding-right: 0;
        }
      }
    }
  }
  .bottom {
    display: grid;
    width: 100%;
    grid-template-columns: repeat(3, 1fr);
    .column {
      padding-top: 14px;
    }
  }
}
</style>

<template>
  <div class="drop-bar">
    <div class="drop-container">
      <div class="drop-title">
        <div class="text"> 
          <div class="content">Tất cả chuyên mục</div> 
        </div>
        <CustomButton class="button" @click="hideDrop">
          Đóng
          <InlineSvg :src="exit" class="icon"/>
        </CustomButton>
      </div>
      <Categories></Categories>
    </div>
  </div>
</template>

<script>
import CustomButton from '../common/CustomButton';
import Categories from './Categories.vue';
import { mapActions } from 'vuex';
import { GCLOUD_URL, VUE_APP_ASSETS_DIR } from '@/constants';
export default {
  name: "DropBar",
  components: { Categories, CustomButton },
  methods: {
    ...mapActions(['hideDrop'])
  },
  data() {
    return {
      exit: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/basic_exit_icon.svg`
    }
  }
}
</script>

<style scoped lang="scss">
.drop-bar {
  position: sticky;
  top: 50px;
  width: 100%;
  background-color: #fff;
  height: 92vh;
  .drop-container {
    width: 72%;
    height: 100%;
    margin: auto;
    .drop-title {
      height: 55px;
      width: 100%;
      border-bottom: 1px solid #303030;
      .text {
        float: left;
        width: auto;
        height: 100%;
        display: flex;
        .content {
          margin: auto 0;
          font-size: 20px;
          font-weight: bold;
          color:#303030;
        }
      };
      .button {
        float: right;
        width: 100px;
        .icon {
          margin: auto;
          height: 15px;
          width: auto;
        }
      }
    }
  }
}
</style>

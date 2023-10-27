<template>
  <div>
    <div class="download">
      <div class="title">
        Tải ứng dụng
      </div>
      <div class="btn-group">
        <CustomButton class="btn">
            button 1
        </CustomButton>
        <CustomButton class="btn">
            button 2
        </CustomButton>
      </div>
    </div>
    <div class="contact">
      <div class="title">
        Liên hệ
      </div>
      <div class="content">
          <div class="link">
            <CustomIcon src="base_bash_icon.svg" class="icon"/>
            <span>Tòa soạn</span>
          </div>
          <div class="link">
            <CustomIcon src="base_bash_icon.svg" class="icon"/>
            <span>Quảng cáo</span>
          </div>
          <div class="link">
            <CustomIcon src="base_bash_icon.svg" class="icon"/>
            <span>Hợp tác bản quyền</span>
          </div>
      </div>
    </div>
  </div>
</template>

<script>
import CustomButton from '../common/CustomButton';
import CustomIcon from '../common/CustomIcon';
export default {
  name: "Contact",
  components: { CustomIcon, CustomButton },
}
</script>

<style lang="scss" scoped>
.title {
  display: flex;
  padding: 10px 5px;
}
.download {
  width: 100%;
  .btn-group {
    display: flex;
    justify-content: space-between;
    .btn {
      padding: 10px 5px;
      width: 140px;
      background-color: #eee;
      &:hover {
        background-color: #ddd;
      }
    }
  }
}
.contact {
  margin: 10px 0px;
  .content {
    display: flex;
    flex-wrap: wrap;
    row-gap: 10px;
    .link {
      display: flex;
      min-width: 50%;
      position: relative;
      .icon {
        height: 30px;
      }
      span {
        padding: 5px 30px;
      }
      &:hover {
        color: blue;
        cursor: pointer;
      }
    }
  }
}
</style>

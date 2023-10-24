<template>
<div class="profile-group">
  <div class="group-label">
    <div class="label">{{ label }}</div>
    <div class="link" @click="toggleDataChange">
      {{ dataChange ? 'Đóng' : 'Thay đổi'}}
    </div>
  </div>
  <div class="group-content">
    <div class="info-change-wrapper" v-if="dataChange">
      <slot></slot>
    </div>
    <div v-else>
      {{ value || 'Chưa có dữ liệu'}}
    </div>
  </div>
</div>
</template>

<script>
export default {
  name: "userProfileField",
  props: {
    label: {
      type: String,
      default: "Họ tên"
    },
    value: {
      type: String,
      default: null
    }
  },
  data() {
    return {
      dataChange: false
    }
  },
  methods: {
    toggleDataChange() {
      this.dataChange = !this.dataChange
    }
  }
}
</script>

<style scoped lang="scss">
.profile-group {
  display: flex;
  flex-direction: column;
  text-align: start;
  font-size: 20px;
  .group-label {
    display: flex;
    justify-content: space-between;
    height: 40px;
    .link {
      color: #aaa;
      text-decoration: underline;
      &:hover{
        cursor: pointer;
      }
    }
  };
  .group-content{
    color: #aaa;
  }
}
</style>

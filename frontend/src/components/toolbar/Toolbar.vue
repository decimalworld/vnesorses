<template>
<div>
  <div class="advertise">

  </div>
  <div class="toolbar">
    <div class="content">
      <div class="left-content">
        <div class="brand" @click="this.$router.push({name: 'home'})">
          <div class="text">VNESORSES</div>
        </div>
        <Border direction="left" style="height: 50%"/>
        <div class="date">
          <div class="text"> {{ date }}</div>
        </div>
        <Border direction="left" style="height: 50%"/>
        <div class="weather">
          <div class="location text">{{ "TPHCM" }}</div>
          <div class="text">{{ "33&deg;" }}</div>
        </div>
      </div>
      <div class="right-content">
        <div class="right-tab">
          <InlineSvg :src="clock" class="icon"></InlineSvg>
          <div class="text">
            Mới nhất
          </div>
        </div>
        <div class="right-tab">
          <InlineSvg :src="location" class="icon"></InlineSvg>
          <div class="text">
            Tin theo khu vực
          </div>
        </div>
        <div class="right-tab">
          <InlineSvg :src="baseBash" class="icon"></InlineSvg>
          <div class="text">
            International
          </div>
        </div>
        <Border direction="left" style="height: 50%"/>
        <div class="right-tab">
          <InlineSvg :src="search" class="icon"></InlineSvg>
        </div>
        <div
          v-if="Object.keys(user).length == 0" 
          class="right-tab login" 
          @click="$emit('click-authen')"
        >
          <InlineSvg :src="userIcon" class="icon"></InlineSvg>
          <div class="text">Đăng nhập</div>
        </div>
        <div v-else class="right-tab loggedin" @click="displayDropdown=!displayDropdown">
          <InlineSvg :src="userLoggedin" class="icon"></InlineSvg>
          <InlineSvg :src="downArrow" class="icon"></InlineSvg>
          <Dropdown v-show="displayDropdown" @mouseleave="displayDropdown=false"></Dropdown>
        </div>
        <div class="notification">
          <InlineSvg :src="notification" class="icon"></InlineSvg>
        </div>
      </div>
    </div>
  </div>
</div>
</template>

<script>
import { GCLOUD_URL, VUE_APP_ASSETS_DIR } from '@/constants';
import { mapGetters } from 'vuex';
import moment from 'moment'
import Dropdown from './Dropdown.vue';
import Border from '../common/Border.vue';
import router from '@/router';
export default {
  name: "toolbar",
  components: { Dropdown, Border },
  data() {
    return {
      date: moment().format('dddd, DD/M/YYYY'),
      notification: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/notification_icon.svg`,
      userIcon: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/user_icon.svg`,
      userLoggedin: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/user_loggedin_icon.svg`,
      search: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/search_icon.svg`,
      baseBash: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/base_bash_icon.svg`,
      location: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/location_icon.svg`,
      clock: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/clock_icon.svg`,
      downArrow: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/down_arrow_icon.svg`,
      displayDropdown: false,
    }
  },
  computed: {
    ...mapGetters(["user"])
  },
}
</script>

<style scoped lang="scss">
.advertise {
  height: 265px;
  background-color: aqua;
}
.toolbar {
  height: 50px;
  margin-bottom: 10px;
  padding-bottom: 5px;
  .content {
    width: 75%;
    height: 100%;
    margin: auto;
    display: block;
    .left-content {
      float: left;
      display: flex;
      height: 100%;
      flex-direction: row;
      .text {
        margin: auto;
      }
      .brand {
        width: 180px;
        height: 100%;
        display: flex;
        cursor: pointer;
      }
      .date {
        width: 160px;
        height: 100%;
        display: flex;
        .text {
          font-size: 14px;
        }
      }
      .weather {
        display: flex;
        flex-direction: row;
        font-size: 14px;
        cursor: pointer;
        .location {
          width: 80px;
        }
      }
    }
    .right-content {
      float: right;
      height: 100%;
      padding-right: 20px; 
      display: flex;
      .right-tab {
        height: 100%;
        display:flex;
        margin: auto 10px;
        color: #aaa;
        cursor: pointer;
        &:hover {
          color: #777;
        }
        .text {
          margin: auto 5px;
          font-size: 14px;
        }
      }
      .login {
        color: #666;
        &:hover {
          color: rgb(0, 132, 255);
        }
      }
      .loggedin{
        position: relative;
      }
      .notification {
        width: 30px;
        height: 100%;
        display: flex;
        cursor: pointer;
      }
    }
  }
  .icon {
    margin: auto;
    height: 20px;
    width: auto;
  }
}
</style>

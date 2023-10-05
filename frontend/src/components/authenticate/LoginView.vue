<template>
  <div class="login-view">
    <div class="login-content">
      <div class="view-wrapper">
        <div class="title">
          <span>Đăng nhập với email</span>
        </div>
        <input type="text" class="text-input" placeholder="Email">
        <div class="error-field"></div>
        <input type="text" class="text-input" placeholder="Mật khẩu">
        <div class="error-field"></div>
        <div class="button login clickable">
          <span>Đăng nhập</span>
        </div>
        <div class="button forgot-password">
          <span class="clickable">Lấy lại mật khẩu</span>
        </div>
      </div>
      <div class="border">
  
      </div>
      <div class="view-wrapper">
        <div class="title">
          <span>Đăng nhập với</span>
        </div>
        <div class="button social facebook">
          <span>
            <InlineSvg :src="facebook" class="icon"></InlineSvg>
            Facebook
          </span>
        </div>
        <div class="button social google">
          <span>
            <InlineSvg :src="google" class="icon"></InlineSvg>
            Google
          </span>
        </div>
        <div class="button social apple">
          <span>
            <InlineSvg :src="apple" class="icon"></InlineSvg>
            Apple
          </span>
        </div>
      </div>
    </div>
    <div class="footer">
      <span>
        Bạn đăng nhập là đồng ý với <em>điều khoản sử dụng</em> và <em>chính sách bảo mật</em> của VnExpress & được bảo vệ bởi reCAPTCHA
      </span>
    </div>
  </div>
</template>

<script>
import { GCLOUD_URL, VUE_APP_ASSETS_DIR } from '@/constants';
export default {
  name: "LoginView",
  data() {
    return {
      facebook: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/facebook_icon.svg`,
      google: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/google_icon.svg`,
      apple: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/apple_icon.svg`,
    }
  }
}
</script>

<style scoped lang="scss">
.login-view {
  height: 100%;
  display: flex;
  flex-direction: column;
  .login-content {
    display: grid;
    grid-template-columns: 53% 0% 47%;
    .view-wrapper {
      height: 100%;
      display: flex;
      flex-direction: column;
      .title {
        height: 90px;
        width: 100%;
        display: flex;
        span {
          margin: auto;
          font-size: 18px;
        }
      }
      .text-input {
        height: 50px;
        margin: 0 40px;
        padding: 0 15px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 18px;
      }
      .error-field {
        height: 45px;
      }
      .login {
        color: #fff;
        background-color: #ccc;
        font-weight: bold;
      }
      .button {
        height: 50px;
        margin: 0 40px;
        padding: 0 15px;
        border-radius: 5px;
        font-size: 18px;
        display: flex;
        &:hover {
          cursor: pointer;
        }
        span {
          margin: auto;
        }
      }
      .forgot-password {
        color: #aaa;
        &:hover{
          cursor: context-menu;
        }
      }
      .social {
        font-weight: bold;
        margin-bottom: 30px;
        span {
          left: 0;
          width: 100%;
          margin-left: 0;
          padding: auto;
          position: relative;
        }
      }
      .facebook {
        border: 1px solid rgb(29, 2, 182);
        color: rgb(29, 2, 182);
        
      }
      .google {
        border: 1px solid rgb(0, 119, 255);
        color: rgb(0, 119, 255);
        font-weight: bold;
        margin-bottom: 30px;
      }
      .apple {
        border: 1px solid black;
        color: black;
        font-weight: bold;
      }
    }
    .border {
      margin-top: auto;
      margin-bottom: 30px;
      border-left: 1px solid #ccc;
      height: 83%;
    }
    .clickable {
      &:hover {
        cursor: pointer;
      }
    }
  }
  .footer {
    height: 100%;
    display: flex;
    span {
      margin: auto 95px;
      color: #aaa;
      em {
        text-decoration: underline;
        font-style: normal;
        color: rgb(9, 114, 212);
        &:hover {
          cursor: pointer;
        }
      }
    }
  }
  .icon {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    height: 20px;
    width: auto;
    margin: auto 0;
  }
}
</style>

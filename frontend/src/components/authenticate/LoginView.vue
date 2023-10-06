<template>
  <div class="login-view">
    <div class="login-content">
      <div class="view-wrapper">
        <div class="title">
          <span>Đăng nhập với email</span>
        </div>
        <input 
          type="text" 
          class="text-input" 
          placeholder="Email" 
          v-model="email" 
          @keyup="validate_email"
        />
        <div class="error-field">
          <span>
            {{ email_error }}
          </span>
        </div>
        <div class="password-wrapper">
          <input 
            :type="show_password ? 'text' : 'password'" 
            class="text-input" 
            placeholder="Mật khẩu" 
            v-model="password"
            @keyup="validate_password"
          >
          <InlineSvg :src="show_password ? eye_off : eye_on" class="show-icon" @click="toggle_show_password"></InlineSvg>
        </div>
        <div class="error-field">
          <span>
            {{ password_error }}
          </span>
        </div>
        <div 
          :class="`button clickable ${submitable() ? 'login-true' : 'login-false'}`"
          @click="submitable() && login()"
        >
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
import { GCLOUD_URL, VUE_APP_ASSETS_DIR, VUE_APP_BACKEND_URL } from '@/constants';
import { mapGetters, mapActions } from 'vuex';
import axios from 'axios';
export default {
  name: "LoginView",
  data() {
    return {
      facebook: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/facebook_icon.svg`,
      google: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/google_icon.svg`,
      apple: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/apple_icon.svg`,
      eye_on: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/eye_on_icon.svg`,
      eye_off: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/eye_off_icon.svg`,
      email: '',
      email_error: '',
      password: '',
      password_error: '',
      show_password: false,
    }
  },
  methods: {
    ...mapActions(['setToken', 'toggleLoading']),
    toggle_show_password() {
      this.show_password = !this.show_password
    },
    validate_password() {
      if (this.password.length < 6) {
        this.password_error = 'Mật khẩu phải nhiều hơn 6 chữ cái'
      } else {
        this.password_error = ''
      }
    },
    validate_email() {
      if (!this.email.match(/^[^@\s]+@[^@\s]+\.[^@\s]+$/)){
        this.email_error = 'Email không hợp lệ'
      } else {
        this.email_error=''
      }
    },
    submitable() {
      return (
        !(this.password_error || this.email_error) 
        && this.email && this.password && true
      )
    },
    async login() {
      this.toggleLoading()
      await axios({
        method: 'post',
        url: `${VUE_APP_BACKEND_URL}/users/sign_in`,
        data: {
          user: {
            email: this.email,
            password: this.password
          }
        }
      })
      .then(response => {
        const data = response.data.status.data
        this.setToken(data.token)
      })
      .catch(err => {
        console.clear()
        this.email_error = err.response.data.error_message
      })
      .then(this.toggleLoading)
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
      width: 100%;
      display: block;
      .title {
        height: 90px;
        width: 100%;
        display: flex;
        span {
          margin: auto;
          font-size: 18px;
        }
      }
      .password-wrapper {
        position: relative;
        .show-icon {
          position: absolute;
          top: 0;
          bottom: 0;
          right: 12%;
          height: 20px;
          width: auto;
          margin: auto 0;
          &:hover {
            cursor: pointer;
          }
        }
      }
      .text-input {
        height: 50px;
        width: 80%;
        margin: 0 10%;
        padding: 0 15px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 18px;
        box-sizing: border-box;
      }
      .error-field {
        height: 45px;
        display: flex;
        span {
          margin: auto 10%;
          color: red;
        }
      }
      .login-false {
        color: #fff;
        background-color: #ccc;
        font-weight: bold;
      }
      .login-true {
        color: #fff;
        background-color: rgb(161, 5, 52);
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

<template>
  <div class="signup-view">
    <div class="signup-content">
      <div class="view-wrapper">
        <div class="title">
          <div>Tạo tài khoản VnEsorses</div>
          <div>Để sử dụng đầy đủ tính năng đọc báo và tham</div> 
          <div>gia cộng đồng hơn 0 triệu thành viên</div>
        </div>
        <input 
          type="text" 
          class="text-input" 
          placeholder="Nhập email"
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
            placeholder="Tạo mật khẩu"
            v-model="password"
            @keyup="validate_password"
          />
          <InlineSvg 
            :src="show_password ? eye_off : eye_on"
            @click="toggle_show_password" 
            class="show-icon"
          ></InlineSvg>
        </div>
        <div class="error-field">
          <span>
            {{ password_error }}
          </span>
        </div>
        <div 
          :class="`button clickable ${submitable() ? 'signup-true' : 'signup-false'}`"
            @click="submitable() && signup()"
        >
          <span>
            Tạo tài khoản
          </span>
        </div>
      </div>
      <div class="border"></div>
      <div class="view-wrapper">
        <div class="title">
          <div>Tạo tài khoản với</div>
        </div>
        <div class="social facebook button">
          <span>
            <InlineSvg :src="facebook" class="icon"></InlineSvg>
            Facebook
          </span>
        </div>
        <div class="social google button">
          <span>
            <InlineSvg :src="google" class="icon"></InlineSvg>
            Google
          </span>
        </div>
        <div class="social apple button">
          <span>
            <InlineSvg :src="apple" class="icon"></InlineSvg>
            Apple
          </span>
        </div>
      </div>
    </div>
    <div class="footer">
      <span>
        Bạn tạo tài khoản là đồng ý với <em>quy định</em>, <em>điều khoản sử dụng</em> và <em>chính sách bảo mật</em> của VnEsorses và được bảo vệ bởi reCAPTCHA
      </span>
    </div>
  </div>
</template>

<script>
import { GCLOUD_URL, VUE_APP_ASSETS_DIR, VUE_APP_BACKEND_URL } from '@/constants';
import axios from 'axios';
import { mapActions } from 'vuex';

export default{
  name: "SignUpView",
  data() {
    return {
      facebook: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/facebook_icon.svg`,
      google: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/google_icon.svg`,
      apple: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/apple_icon.svg`,
      eye_on: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/eye_on_icon.svg`,
      eye_off: `${GCLOUD_URL}/${VUE_APP_ASSETS_DIR}/eye_off_icon.svg`,
      show_password: false,
      email: '',
      email_error: '',
      password: '',
      password_error: '',
    }
  },
  methods: {
    ...mapActions(['toggleLoading', 'setUser']),
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
    async signup() {
      this.toggleLoading()
      await axios({
        method: 'post',
        url: `${VUE_APP_BACKEND_URL}/users`,
        data: {
          user: {
            email: this.email,
            password: this.password
          }
        }
      })
      .then(response => {
        const data = response.data.user
        this.setUser(data)
        this.$emit('after-auth')
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

<style lang="scss" scoped>
.signup-view {
  height: 100%;
  display: flex;
  flex-direction: column;
  .signup-content{
    display: grid;
    grid-template-columns: 53% 0% 47%;
    .border {
      margin-top: 35px;
      margin-bottom: 0px;
      border-left: 1px solid #ccc;
    }
    .view-wrapper{
      height: 100%;
      .title{
        margin-top: 30px;
        margin-bottom: 25px;
        height: 92px;
        display: flex;
        flex-direction: column;
        div {
          font-size: 18px;
          margin: auto;
          padding: 5px 0;
        }
      }
      .text-input{
        position: relative;
        height: 55px;
        width: 80%;
        margin: auto;
        font-size: 16px;
        padding: 0 15px;
        box-sizing: border-box;
      }
      .password-wrapper{
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
      .error-field{
        height: 20px;
        display: flex;
        span {
          margin: auto 10%;
          color: red;
        }
      }
      .signup-false {
        color: #fff;
        background-color: #ccc;
        font-weight: bold;
      }
      .signup-true {
        color: #fff;
        background-color: rgb(161, 5, 52);
        font-weight: bold;
      }
      .button {
        height: 50px;
        width: 80%;
        margin: auto;
        margin-bottom: 5px;
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
      }
      .apple {
        border: 1px solid black;
        color: black;
        font-weight: bold;
        margin-bottom: 0px;
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
    left: 15px;
    height: 20px;
    width: auto;
    margin: auto 0;
  }
}
</style>

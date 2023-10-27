<template>
  <div class="signup-view">
    <div class="signup-content">
      <div class="view-wrapper">
        <CustomTitle style="line-height: 28px;">
          Tạo tài khoản VnEsorses<br/>
          Để sử dụng đầy đủ tính năng đọc báo và tham<br/> 
          gia cộng đồng hơn 0 triệu thành viên
        </CustomTitle>
        <CustomInput
          type="text"
          placeholder="Nhập email"
          v-model:inputModel="email"
          @keyup="validate_email"
        />
        <div class="error-field">
          <span>
            {{ email_error }}
          </span>
        </div>
        <CustomPassword
          v-model:password="password"
          v-model:passwordError="passwordError"
        />
        <div class="error-field">
          <span>
            {{ passwordError }}
          </span>
        </div>
        <CustomButton 
          :class="`clickable ${submitable() ? 'signup-true' : 'signup-false'}`"
            @click="submitable() && signup()"
        >
            Tạo tài khoản
        </CustomButton>
      </div>
      <div class="border"></div>
      <div class="view-wrapper">
        <CustomTitle style="line-height: 84px;">
          Tạo tài khoản với
        </CustomTitle>
        <CustomButton class="social facebook">
          <CustomIcon src="facebook_icon.svg" class="icon"/>
          Facebook
        </CustomButton>
        <CustomButton class="social google">
          <CustomIcon src="google_icon.svg" class="icon"/>
          Google
        </CustomButton>
        <CustomButton class="social apple">
          <CustomIcon src="apple_icon.svg" class="icon"/>
          Apple
        </CustomButton>
      </div>
    </div>
    <AuthenFooter>
      Bạn tạo tài khoản là đồng ý với <em>quy định</em>, <em>điều khoản sử dụng</em> và <em>chính sách bảo mật</em> của VnEsorses và được bảo vệ bởi reCAPTCHA
    </AuthenFooter>
  </div>
</template>

<script>
import { VUE_APP_BACKEND_URL } from '@/constants';
import axios from 'axios';
import { mapActions } from 'vuex';
import AuthenFooter from './AuthenFooter';
import CustomTitle from './CustomTitle';
import CustomButton from '../common/CustomButton';
import CustomInput from './CustomInput';
import CustomIcon from '../common/CustomIcon';
import CustomPassword from './CustomPassword';

export default{
  name: "SignUpView",
  components: { CustomTitle, AuthenFooter, CustomButton, CustomInput, CustomIcon, CustomPassword },
  data() {
    return {
      email: '',
      email_error: '',
      password: '',
      passwordError: '',
    }
  },
  methods: {
    ...mapActions(['toggleLoading', 'setUser']),
    toggle_show_password() {
      this.show_password = !this.show_password
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
        !(this.passwordError || this.email_error) 
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

      .social {
        font-weight: bold;
        margin-bottom: 30px;
      }
      .facebook {
        border: 1px solid rgb(29, 2, 182);
        color: rgb(29, 2, 182);
      }
      .google {
        border: 1px solid rgb(0, 119, 255);
        color: rgb(0, 119, 255);
      }
      .apple {
        border: 1px solid black;
        color: black;
        margin-bottom: 0px;
      }
      .icon {
        left: 15px;
      }
    }
  }
}
</style>

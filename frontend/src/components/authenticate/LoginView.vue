<template>
  <div class="login-view">
    <div class="login-content">
      <div class="view-wrapper">
        <CustomTitle>
          Đăng nhập với email
        </CustomTitle>
        <CustomInput
          type="text"
          placeholder="Email"
          v-model:inputModel="email"
          @input="validateEmail"
        />
        <div class="error-field">
            {{ emailError }}
        </div>
        <CustomPassword 
          v-model:password="password"
          v-model:passwordError="passwordError"
        />
        <div class="error-field">
            {{ passwordError }}
        </div>
        <CustomButton 
          :class="`clickable ${submitable() ? 'login-true' : 'login-false'}`"
          @click="submitable() && login()"
        >
          Đăng nhập
        </CustomButton>
        <CustomButton class="forgot-password">
          Lấy lại mật khẩu
        </CustomButton>
      </div>
      <div class="border">
  
      </div>
      <div class="view-wrapper">
        <CustomTitle>
          Đăng nhập với
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
      Bạn đăng nhập là đồng ý với <em>điều khoản sử dụng</em> và <em>chính sách bảo mật</em> của VnExpress & được bảo vệ bởi reCAPTCHA
    </AuthenFooter>
  </div>
</template>

<script>
import { VUE_APP_BACKEND_URL } from '@/constants';
import { mapActions } from 'vuex';
import axios from 'axios';
import AuthenFooter from './AuthenFooter';
import CustomTitle from './CustomTitle';
import CustomButton from '../common/CustomButton.vue';
import CustomInput from './CustomInput';
import CustomIcon from '../common/CustomIcon';
import CustomPassword from './CustomPassword';
export default {
  name: "LoginView",
  components: { AuthenFooter, CustomTitle, CustomButton, CustomInput, CustomIcon, CustomPassword },
  data() {
    return {
      email: '',
      emailError: '',
      password: '',
      passwordError: '',
    }
  },
  methods: {
    ...mapActions(['toggleLoading', 'setUser', 'setToken']),
    validateEmail() {
      if (!this.email.match(/^[^@\s]+@[^@\s]+\.[^@\s]+$/)){
        this.emailError = 'Email không hợp lệ'
      } else {
        this.emailError=''
      }
    },
    submitable() {
      return (
        !(this.passwordError || this.emailError) 
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
        const data = response.data.user;
        this.setUser(data);
        this.setToken(data.token);
        this.$emit('exit');
        this.$router.go(0);
      })
      .catch(err => {
        console.clear();
        this.emailError = err.response.data.error_message;
      })
      .then(this.toggleLoading)
    }
  }
}
</script>

<style scoped lang="scss">
.login-view {
  height: 100%;
  .login-content {
    display: grid;
    grid-template-columns: 53% 0% 47%;
    .view-wrapper {
      .error-field {
        text-align: start;
        height: 18px;
        padding: 13px 50px;
        color: red;
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
      .forgot-password {
        color: #aaa;
        &:hover{
          cursor: context-menu;
        }
        span:hover {
          cursor: pointer;
        }
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
      }
      .icon {
        left: 15px;
      }
    }
    .border {
      margin: 35px 0;
      border-left: 1px solid #ccc;
      height: 85%;
    }
  }
}
</style>

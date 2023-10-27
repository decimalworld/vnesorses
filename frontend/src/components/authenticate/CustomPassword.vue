<template>
  <div class="password-wrapper">
    <CustomInput
      :type="showPassword ? 'text' : 'password'"
      placeholder="Mật khẩu"
      v-model:inputModel="password"
      @input="
        validatePassword(); 
        $emit('update:passwordError', passwordError);
        $emit('update:password', $event.target.value)"
    />
    <CustomIcon :src="showPassword ? 'eye_off_icon.svg' : 'eye_on_icon.svg'" class="show-icon" @click="toggleShowPassword"/>
  </div>
</template>

<script>
import CustomInput from './CustomInput.vue';
import CustomIcon from '../common/CustomIcon';

export default {
  name: "customPassword",
  components: { CustomIcon, CustomInput},
  data() {
    return {
      showPassword: false,
      password: '',
      passwordError: '',
    }
  },
  methods: {
    validatePassword() {
      if (this.password.length < 6) {
        this.passwordError = 'Mật khẩu phải nhiều hơn 6 chữ cái'
      } else {
        this.passwordError = ''
      }
    },
    toggleShowPassword() {
      this.showPassword = !this.showPassword
    },
  }
}

</script>

<style scoped lang="scss">
.password-wrapper {
  position: relative;
  .show-icon {
    top: 0;
    bottom: 0;
    right: 12%;
    &:hover {
      cursor: pointer;
    }
  }
}
</style>

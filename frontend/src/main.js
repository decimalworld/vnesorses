import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import InlineSvg from 'vue-inline-svg';
import helper from './helpers/helper';
import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css';

createApp(App)
.component('InlineSvg', InlineSvg)
.component('VueDatePicker', VueDatePicker)
.use(store)
.use(router)
.provide('helpers', helper)
.mount('#app')

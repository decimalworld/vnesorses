import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import InlineSvg from 'vue-inline-svg';
import helper from './helpers/helper';

createApp(App)
.component('InlineSvg', InlineSvg)
.use(store)
.use(router)
.provide('helpers', helper)
.mount('#app')

import { createStore } from 'vuex';
import * as pages from './pages';
import * as blogs from './blogs';

export default createStore({
  modules: {
    pages,
    blogs
  }
})

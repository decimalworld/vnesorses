import { createStore } from 'vuex';
import * as pages from './pages';
import * as blogs from './blogs';
import * as session from './session';

export default createStore({
  modules: {
    pages,
    blogs,
    session
  }
})

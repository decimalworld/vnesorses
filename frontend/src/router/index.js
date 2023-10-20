import { createRouter, createWebHistory } from 'vue-router';
import HomeView from '../views/HomeView.vue';
import EditBlogView from '../views/EditBlogView.vue';
import ShowBlogView from '../views/ShowBlogView.vue';
import UserProfileView from '../views/UserProfileView.vue';
import { BASE_URL, VUE_APP_BACKEND_URL } from '@/constants';
import store from '../store';
import axios from 'axios';

const fetchUserProfile = async (to, from, next) => {
  return await axios({
    method: 'get',
    headers: {
      'Authorization': store.getters.token
    },
    url: `${VUE_APP_BACKEND_URL}/users/user_profile`
  })
  .then(response => {
    store.dispatch("setProfile", response.data.user_profile)
    next()
  })
  .catch(err => next({ name: 'home' }))
}

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  }, {
    path: '/edit-blog',
    name: 'editBlog',
    component: EditBlogView
  }, {
    path: '/:category',
    name: 'category',
    component: HomeView
  }, {
    path: '/:category/:tag',
    name: 'tag',
    component: HomeView
  }, {
    path: '/blog/:id',
    name: 'showBlog',
    component: ShowBlogView
  }, {
    path: '/user/user-profile',
    name: 'userProfile',
    component: UserProfileView,
    beforeEnter: [fetchUserProfile]
  }
]

const router = createRouter({
  history: createWebHistory(BASE_URL),
  routes,
  scrollBehavior (to, from, savedPosition) {
    let el = document.querySelector('#app-content')
    el.scrollTop=0;
    return {
      el: "#app-content"
    }
  },
})

router.beforeEach((to, from, next) => {
  // if (from.name == 'userProfile') {
  //   location.reload()
  // }
  next()
})

export default router

import { createRouter, createWebHistory } from 'vue-router';
import HomeView from '../views/HomeView.vue';
import EditBlogView from '../views/EditBlogView.vue';
import { BASE_URL } from '@/constants';

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
  }
]

const router = createRouter({
  history: createWebHistory(BASE_URL),
  routes
})

export default router

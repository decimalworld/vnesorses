import { createRouter, createWebHistory } from 'vue-router';
import HomeView from '../views/HomeView.vue';
import EditBlogView from '../views/EditBlogView.vue';

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
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router

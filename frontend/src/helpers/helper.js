import { VUE_APP_BACKEND_URL } from "@/constants";
import router from "@/router";
import store from "@/store";
import axios from "axios";

const helper = {
  goToBlog(id) {
    router.push({ name: `showBlog`, params: { id: id } })
  },
  goToCategory(url_name) {
    router.push({ name: `category`, params: { category: url_name } })
  },
  goToTag(category_url_name, tag_url_name) {
    router.push({ name: `tag`, params: { category: category_url_name, tag: tag_url_name } })
  },
  goToProfile() {
    router.push({ name: "userProfile" })
  },

  async uploadImage(blob, signedUrl) {
    axios({
      method: 'put',
      maxBodyLength: Infinity,
      headers: {
        'Content-Type': 'image/png'
      },
      url: signedUrl,
      data: blob
    });
  },

  async getIp() {
    return axios({
      method: 'get',
      url: 'https://api64.ipify.org'
    })
  },
  
  async createLike(comment_id, token) {
    let headers = {RemoteAddress: store.getters.ip}
    if (token) { headers = { ...headers, token} }
    return axios({
      method: 'post',
      headers,
      url: `${VUE_APP_BACKEND_URL}/comments/${comment_id}/likes`,
    })
  },

  async changeAvatar(token) {
    return axios({
      method: 'put',
      headers: {
        'Authorization': token
      },
      url: `${VUE_APP_BACKEND_URL}/users/avatar`
    });
  },
  async getIdentity(token) {
    return axios({
      method: 'get',
      headers: {
        'Authorization': token
      },
      url: `${VUE_APP_BACKEND_URL}/users/identity`
    });
  },
  async getProfile(token){
    return axios({
      method: 'get',
      headers: {
        'Authorization': token
      },
      url: `${VUE_APP_BACKEND_URL}/users/user_profile`
    })
  },
  async postComment(token, comment){
    return axios({
      method: 'post',
      headers: {
        'Authorization': token
      },
      url: `${VUE_APP_BACKEND_URL}/users/comments`,
      data: comment
    })
  },
  async getComment(blogId, options = { order: "latest" }) {
    let headers = {"RemoteAddress": store.getters.ip }
    if (store.getters.token) headers["Authorization"] = store.getters.token
    return axios({
      method: 'get',
      headers,
      url: `${VUE_APP_BACKEND_URL}/blogs/${blogId}/comments`,
      params: options
    })
  },
  async updateComments(blogId, data) {
    let headers = {"RemoteAddress": store.getters.ip }
    if (store.getters.token) headers["Authorization"] = store.getters.token
    return axios({
      method: 'put',
      headers,
      url: `${VUE_APP_BACKEND_URL}/blogs/${blogId}/comments`,
      data
    })
  },
  async updateProfile(token, data) {
    return axios({
      method: 'put',
      headers: {
        'Authorization': token
      },
      url: `${VUE_APP_BACKEND_URL}/users/user_profile`,
      data
    })
  },
  async logout(token) {
    await axios({
      method: 'delete',
      headers: {
        'Authorization': token
      },
      url: `${VUE_APP_BACKEND_URL}/users/sign_out`
    })
    router
    .push({ name: 'home' })
    .then(() => router.go(0))
  },
}

export default helper

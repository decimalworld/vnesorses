import { VUE_APP_BACKEND_URL } from "@/constants";
import router from "@/router";
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
  }
}

export default helper

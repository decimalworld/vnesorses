import axios from "axios"
import { PARAGRAPH_REGEX, IMAGE_REGEX, VUE_APP_BACKEND_URL } from "@/constants"

const state = {
  currentBlog: {
    title: '',
    cover: {
      full_path: ''
    },
    body: '',
    summary: '',
  }
}

const mutations = {
  setCurrentBlog: (state, blog) => state.currentBlog = blog,
  setBlogTitle: (state, title) => state.currentBlog.title = title,
  setBlogCover: (state, full_path) => state.currentBlog.cover.full_path = full_path,
  setBlogBody: (state, body) => {
    state.currentBlog.body = body,
    state.currentBlog.summary = body.match(PARAGRAPH_REGEX)?.groups?.content
  }
}

const getters = {
  getCurrentBlog: state => state.currentBlog,
  getBlogTitle: state => state.currentBlog.title,
  getBlogCover: state => state.currentBlog.cover,
  getBlogBody: state => state.currentBlog.body,
  getBlogImages: state => [...state.currentBlog.body.matchAll(IMAGE_REGEX)].map(img => img.groups.src)
}

const actions = {
  setCurrentBlog({ commit }, blog) {
    commit('setCurrentBlog', blog)
  },
  setBlogTitle({ commit }, title) {
    commit('setBlogTitle', title)
  },
  setBlogCover({ commit }, full_path) {
    commit('setBlogCover', full_path)
  },
  setBlogBody({ commit }, body) {
    commit('setBlogBody', body)
  },
  saveBlog({ state }, id) {
    const url = `${VUE_APP_BACKEND_URL}/blogs/commons/${id}`
    axios.request({
      method: 'patch',
      url,
      data: {
        title: state.currentBlog.title,
        body: state.currentBlog.body
      }
    })
    .then(res => console.log(res))
    .catch(error => console.log(error))
  },
  createBlog({}, data) {
    return axios
    .request({
      method: 'post',
      url: `${VUE_APP_BACKEND_URL}/blogs/commons/`,
      data: data
    })
  },
  clearBlog({ state }) {
    state.currentBlog = {
      title: '',
      cover: '',
      body: '',
    }
  }
}

export {
  state,
  mutations,
  getters,
  actions
}

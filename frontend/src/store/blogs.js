import axios from "axios"

const state = {
  currentBlog: {
    title: '',
    cover: '',
    body: '',
  }
}

const mutations = {
  setCurrentBlog: (state, blog) => state.currentBlog = blog,
  setBlogTitle: (state, title) => state.currentBlog.title = title,
  setBlogCover: (state, cover) => state.currentBlog.cover = cover,
  setBlogBody: (state, body) => state.currentBlog.body = body,
}

const getters = {
  getCurrentBlog: state => state.currentBlog,
  getBlogTitle: state => state.currentBlog.title,
  getBlogCover: state => state.currentBlog.cover,
  getBlogBody: state => state.currentBlog.body,
}

const actions = {
  setCurrentBlog({ commit }, blog) {
    commit('setCurrentBlog', blog)
  },
  setBlogTitle({ commit }, title) {
    commit('setBlogTitle', title)
  },
  setBlogCover({ commit }, cover) {
    commit('setBlogCover', cover)
  },
  setBlogBody({ commit }, body) {
    commit('setBlogBody', body)
  },
  saveBlog({ commit, state }, id) {
    const url = `${process.env.VUE_APP_BACKEND_URL}/blogs/${id}`
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
  createBlog({ commit }, body_image_count) {
    return axios
    .request({
      method: 'post',
      url: `${process.env.VUE_APP_BACKEND_URL}/blogs`,
      data: {
        body_image_count: body_image_count
      }
    })
  }
}

export {
  state,
  mutations,
  getters,
  actions
}

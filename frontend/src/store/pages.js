const state = {
  loading: false,
  preview: false,
  dropVisible: false,
};

const mutations = {
  showDrop: (state) => state.dropVisible = true,
  hideDrop: (state) => state.dropVisible = false,
  toggleLoading: (state) => state.loading = !state.loading,
  togglePreview: (state) => state.preview = !state.preview,
}

const getters = {
  loading: state => state.loading,
  preview: state => state.preview,
  dropVisible: state => state.dropVisible
};

const actions = {
  showDrop: ({ commit }) => commit('showDrop'),
  hideDrop: ({ commit }) => commit('hideDrop'),
  toggleLoading: ({ commit }) => commit('toggleLoading'),
  togglePreview: ({ commit }) => commit('togglePreview'),
}

export {
  state,
  mutations,
  getters,
  actions
}

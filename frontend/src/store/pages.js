const state = {
  loading: false,
  preview: false
};

const mutations = {
  toggleLoading: (state) => state.loading = !state.loading,
  togglePreview: (state) => state.preview = !state.preview
}

const getters = {
  loading: state => state.loading,
  preview: state => state.preview
};

const actions = {
  toggleLoading: ({ commit }) => commit('toggleLoading'),
  togglePreview: ({ commit }) => commit('togglePreview'),
}

export {
  state,
  mutations,
  getters,
  actions
}

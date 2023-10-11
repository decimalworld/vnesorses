const state = {
  loading: false,
  preview: false,
  dropVisible: false,
  masterScroll: 0,
};

const mutations = {
  showDrop: (state) => state.dropVisible = true,
  hideDrop: (state) => state.dropVisible = false,
  toggleLoading: (state) => state.loading = !state.loading,
  togglePreview: (state) => state.preview = !state.preview,
  setMasterScroll: (state, scrollTop) => state.masterScroll = scrollTop,
}

const getters = {
  loading: state => state.loading,
  preview: state => state.preview,
  dropVisible: state => state.dropVisible,
  masterScroll: state => state.masterScroll,
};

const actions = {
  showDrop: ({ commit }) => commit('showDrop'),
  hideDrop: ({ commit }) => commit('hideDrop'),
  toggleLoading: ({ commit }) => commit('toggleLoading'),
  togglePreview: ({ commit }) => commit('togglePreview'),
  setMasterScroll: ({ commit }, scrollTop) => commit('setMasterScroll', scrollTop),
}

export {
  state,
  mutations,
  getters,
  actions
}

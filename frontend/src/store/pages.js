const state = {
  loading: false
};

const mutations = {
  toggleLoading: (state) => state.loading = !state.loading
}

const getters = {
  loading: state => state.loading
};

const actions = {
  toggleLoading: ({ commit }) => commit('toggleLoading')
}

export {
  state,
  mutations,
  getters,
  actions
}

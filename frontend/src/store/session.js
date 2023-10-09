const state = {
  user: {},
}

const mutations = {
  setUser: (state, user) => state.user = user,
}
const getters = {
  user: state => state.user,
  token: state => state.user?.token,
  confirmation: state => state.user?.confirmation_token
}
const actions = {
  setUser: ({ commit }, user) => commit('setUser', user),
}

export{
  state,
  mutations,
  getters,
  actions
}

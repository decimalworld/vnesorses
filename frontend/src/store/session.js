const state = {
  token: ''
}

const mutations = {
  setToken: (state, token) => state.token = token
}
const getters = {
  token: state => state.token
}
const actions = {
  setToken: ({ commit }, token) => commit('setToken', token) 
}

export{
  state,
  mutations,
  getters,
  actions
}

import jsCookie from "js-cookie"

const state = {
  user: {},
  profile: {},
  token: null,
  ip: null,
  onHideFunction: () => {},
}

const mutations = {
  setUser: (state, user) => state.user = user,
  setToken: (state, token) => state.token = token,
  setProfile: (state, userProfile) => state.profile = userProfile,
  setIp: (state, ip) => state.ip = ip,
  setOnHideFunction: (state, func) => state.onHideFunction = func
}
const getters = {
  user: state => state.user,
  profile: state => state.profile,
  ip: state => state.ip,
  token: state => state.token || jsCookie.get('token'),
  confirmation: state => state.user?.confirmation_token,
  onHideFunction: state => state.onHideFunction
}
const actions = {
  setUser: ({ commit }, user) => commit('setUser', user),
  setIp: ({ commit }, ip) => commit('setIp', ip),
  setProfile: ({ commit }, userProfile) => commit('setProfile', userProfile),
  deleteToken: ({ state }) => {
    jsCookie.remove('token')
    state.token = null
  },
  setToken: ({ commit }, token) => {
    jsCookie.set('token', token, { expires: 1 });
    commit('setToken', token);
  },
  setOnHideFunction: ({ commit }, func) => {
    commit('setOnHideFunction', func)
  }
}

export{
  state,
  mutations,
  getters,
  actions
}

import jsCookie from "js-cookie"

const state = {
  user: {},
  profile: {},
  token: null
}

const mutations = {
  setUser: (state, user) => state.user = user,
  setToken: (state, token) => state.token = token,
  setProfile: (state, userProfile) => state.profile = userProfile,
}
const getters = {
  user: state => state.user,
  profile: state => state.profile,
  token: state => state.token || jsCookie.get('token'),
  confirmation: state => state.user?.confirmation_token
}
const actions = {
  setUser: ({ commit }, user) => commit('setUser', user),
  setProfile: ({ commit }, userProfile) => commit('setProfile', userProfile),
  deleteToken: () => jsCookie.delete('token'),
  setToken: ({ commit }, token) => {
    jsCookie.set('token', token, { expires: 1 });
    commit('setToken', token);
  }
}

export{
  state,
  mutations,
  getters,
  actions
}

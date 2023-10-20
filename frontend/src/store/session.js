import jsCookie from "js-cookie"

const state = {
  user: {},
  profile: {}
}

const mutations = {
  setUser: (state, user) => {
    state.user = user
    if (user.token)
      jsCookie.set('token', user.token, 1)
  },
  setProfile: (state, userProfile) => state.profile = userProfile,
}
const getters = {
  user: state => state.user,
  profile: state => state.profile,
  token: state => jsCookie.get('token'),
  confirmation: state => state.user?.confirmation_token
}
const actions = {
  setUser: ({ commit }, user) => commit('setUser', user),
  setProfile: ({ commit }, userProfile) => commit('setProfile', userProfile),
  deleteToken: () => jsCookie.delete('token'),
  setToken: ({ commit }, token) => jsCookie.set('token', token, { expires: 1 })
}

export{
  state,
  mutations,
  getters,
  actions
}

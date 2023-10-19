const state = {
  user: {},
  profile: {}
}

const mutations = {
  setUser: (state, user) => state.user = user,
  setProfile: (state, userProfile) => state.profile = userProfile,
}
const getters = {
  user: state => state.user,
  profile: state => state.profile,
  token: state => state.user?.token,
  confirmation: state => state.user?.confirmation_token
}
const actions = {
  setUser: ({ commit }, user) => commit('setUser', user),
  setProfile: ({ commit }, userProfile) => commit('setProfile', userProfile)
}

export{
  state,
  mutations,
  getters,
  actions
}

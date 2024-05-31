import Cinema from '.'
const prefix = ''
export const login = data => {
  const url = prefix + 'auth/login'
  return Cinema.axiosClient.post(url, data)
}

export const signUp = data => {
  const url = prefix + 'auth/register'
  return Cinema.axiosClient.post(url, data)
  }

export const sendCodeToEmail = data => {
  const url = prefix + 'auth/confirmEmail?email='
  return Cinema.axiosClient.post(url + data)
}

export const resetPassword = data => {
  const url = prefix + 'auth/forgot-password'
  return Cinema.axiosClient.put(url, data)
}

export const changePassword = data => {
  const url = prefix + 'auth/change-password'
  return Cinema.axiosAuth.put(url, data)
}

export const getAccessTokenByRefreshToken = refreshToken => {
  const url = prefix + 'auth/refresh-token?refreshToken='
  return Cinema.axiosClient.get(url + refreshToken)
}

export const getHistoryBillUser = () => {
  const url = prefix + 'bill/get-history-bill-by-user'
  return Cinema.axiosAuth.get(url)
}

export const getProfileUser = () => {
  const url = prefix + 'user/get-profile-user'
  return Cinema.axiosAuth.get(url)
}




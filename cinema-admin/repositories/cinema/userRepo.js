import Cinema from '.'
const prefix = ''

export const getAllUser = () => {
  const url = prefix + 'user/get-all-user-by-admin'
  return Cinema.axiosAuth.get(url)
}




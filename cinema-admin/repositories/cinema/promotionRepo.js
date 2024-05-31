import Cinema from '.'
const prefix = ''

export const getAllPromotion = () => {
  const url = prefix + 'promotion/get-all-promotion-by-admin'
  return Cinema.axiosAuth.get(url)
}

export const createPromotion = data => {
  const url = prefix + 'promotion/create-promotion'
  return Cinema.axiosAuth.post(url, data)
}
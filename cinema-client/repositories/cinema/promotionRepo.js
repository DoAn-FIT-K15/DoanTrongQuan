import Cinema from '.'
const prefix = ''
export const getAllPromotion = () => {
  const url = prefix + 'promotion/get-promotions'
  return Cinema.axiosClient.get(url)
}

export const getPromotionDetail = (id) => {
  const url = prefix + 'promotion/get-promotion-detail?id='
  return Cinema.axiosClient.get(url + id)
}


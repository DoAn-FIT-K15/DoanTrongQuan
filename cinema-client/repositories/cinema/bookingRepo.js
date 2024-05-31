import Cinema from '.'
import axios from 'axios'

const prefix = ''
export const getAllSeat= data => {
  const url = prefix + 'seat/get-all-seat?scheduleId='
  return Cinema.axiosClient.get(url + data)
}

export const updateSeatStatus= data => {
  const url = prefix + 'seat/update-seatStatus'
  return Cinema.axiosClient.put(url , data)
}

export const resetSeatStatus= data => {
  const url = prefix + 'seat/reset-seat-status-by-user?scheduleId='
  return Cinema.axiosAuth.put(url +  data)
}

export const createBill= () => {
  const url = prefix + 'bill/create-bill'
  return Cinema.axiosAuth.post(url)
}
export const getMovie = (schedule) => {
  const url = prefix + 'movie/get-movie-by-schedule?schedule='
  return Cinema.axiosClient.get(url + schedule)
}

export const getAllFood = () => {
  const url = prefix + 'food/get-all-food'
  return Cinema.axiosAuth.get(url)
}
export const getAllPromotionByUser = () => {
  const url = prefix + 'promotion/get-all-promotion-by-user'
  return Cinema.axiosAuth.get(url)
}

export const chooseFood = (data) => {
  const url = prefix + 'billFood/update-billFood'
  return Cinema.axiosAuth.put(url, data)
}

export const getDiscountAmount = data => {
  const url = prefix + 'promotion/get-discount-amount'
  return Cinema.axiosAuth.put(url, data)
}
export const getTotalMoney = user => {
  const url = prefix + 'bill/get-totalMoney?user='
  return Cinema.axiosAuth.get(url + user)
}

export const getPoint = () => {
  const url = prefix + 'user/get-point'
  return Cinema.axiosAuth.get(url)
}
export const submitOrder = (amount,user,schedule) => {
  const url = `https://localhost:8089/submitOrder?amount=${amount}&user=${user}&schedule=${schedule}`;
  return Cinema.axiosAuth.post(url)
}







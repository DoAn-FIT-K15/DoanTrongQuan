import Cinema from '.'
const prefix = ''

export const getAllBill = () => {
  const url = prefix + 'bill/get-all-bill'
  return Cinema.axiosAuth.get(url)
}

export const deleteBillByAdmin = (data) => {
  const url = prefix + 'bill/delete-bill'
  return Cinema.axiosAuth.put(url,data)
}



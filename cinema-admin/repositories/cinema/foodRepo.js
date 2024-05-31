import Cinema from '.'
const prefix = ''

export const createFood = data => {
  const url = prefix + 'food/create-food'
  return Cinema.axiosAuth.post(url, data)
}

export const getAllFood = () => {
    const url = prefix + 'food/get-all-food-admin'
    return Cinema.axiosAuth.get(url)
  }

  export const getFoodByAdmin = (data) => {
    const url = prefix + 'food/get-food-by-admin?foodId='
    return Cinema.axiosAuth.get(url + data)
  }

  export const updateFood = (data) => {
    const url = prefix + 'food/update-food'
    return Cinema.axiosAuth.put(url , data)
  }
  


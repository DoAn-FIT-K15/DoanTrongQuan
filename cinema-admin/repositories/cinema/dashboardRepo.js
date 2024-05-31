import Cinema from '.'
const prefix = ''

export const getRevenueCinema = () => {
  const url = prefix + 'cinema/get-all-revenue'
  return Cinema.axiosAuth.get(url)
}


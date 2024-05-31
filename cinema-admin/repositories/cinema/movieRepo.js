import Cinema from '.'
const prefix = ''

export const getAllMovie = () => {
  const url = prefix + 'movie/get-all-movie-by-admin'
  return Cinema.axiosAuth.get(url)
}

export const createMovie = (data) => {
  const url = prefix + 'movie/create-movie'
  return Cinema.axiosAuth.post(url,data)
}
export const updateMovie = (data) => {
  const url = prefix + 'movie/update-movie'
  return Cinema.axiosAuth.put(url,data)
}

export const getMovie = (data) => {
  const url = prefix + 'movie/get-movie?slug='
  return Cinema.axiosClient.get(url + data)
}

export const getMovieType = () => {
  const url = prefix + 'movie/get-movie-type-name'
  return Cinema.axiosClient.get(url)
}

export const getAllCinemaName = () => {
  const url = prefix + 'cinema/get-all-cinema-name'
  return Cinema.axiosClient.get(url)
}

export const stopShowMovie = (slug) => {
  const url = prefix + 'movie/stop-show-movie?slug='
  return Cinema.axiosAuth.put(url + slug)
}


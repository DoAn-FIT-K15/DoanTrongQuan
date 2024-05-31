import Cinema from '.'
const prefix = ''
export const getAllMovieByCinema = data => {
  const url = prefix + 'movie/get-all-movie-by-cinema?nameOfCinema='
  return Cinema.axiosClient.get(url + data)
}

export const getMovieDetail = data => {
  const url = prefix + 'movie/get-movie-detail?slug='
  return Cinema.axiosClient.get(url + data)
}

export const getScheduleByMovie = data => {
  const url = prefix + 'schedule/get-all-schedule-by-movie?slug='
  return Cinema.axiosClient.get(url + data)
}

export const getAllMovieSuggest = () => {
  const url = prefix + 'movie/get-all-movie-suggest'
  return Cinema.axiosClient.get(url)
}

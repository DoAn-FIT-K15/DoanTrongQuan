import Cinema from '.'
const prefix = ''

export const getAllSchedule = () => {
  const url = prefix + 'schedule/get-all-schedule-by-admin'
  return Cinema.axiosAuth.get(url)
}

export const getAllMovieSchedule = () => {
  const url = prefix + 'movie/get-all-movie-schedule-by-admin'
  return Cinema.axiosClient.get(url)
}

export const getAllRoomSchedule = () => {
  const url = prefix + 'room/get-all-room-schedule-by-admin'
  return Cinema.axiosClient.get(url)
}

export const createSchedule = (data) => {
  const url = prefix + 'schedule/create-schedule'
  return Cinema.axiosAuth.post(url,data)
}

export const deleteScheduleByAdmin = (data) => {
  const url = prefix + 'schedule/delete-schedule'
  return Cinema.axiosAuth.put(url,data)
}



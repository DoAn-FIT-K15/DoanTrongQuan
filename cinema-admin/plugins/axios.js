import axios from 'axios'
import Cinema from '~/repositories/cinema';

export default defineNuxtPlugin(nuxtApp => {
  const config = useRuntimeConfig()
  
  const axiosInstance = axios.create({
    baseURL: config.app.api.baseUrl,
    headers: {
      'Content-Type': 'application/json',
    },
  })
  Cinema.setAxiosClient(axiosInstance)
})

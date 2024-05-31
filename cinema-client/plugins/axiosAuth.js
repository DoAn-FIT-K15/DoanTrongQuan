import axios from 'axios'
import Cinema from '~/repositories/cinema';
import { useAuth } from '~/composables/authentication/useAuth'; 
import { useToken } from '~/composables/authentication/useToken';
import { PREFIX_TOKEN } from '../constant'

export default defineNuxtPlugin(nuxtApp => {
  const config = useRuntimeConfig()
  const { timeExpiredAccess, accessToken } = useToken()
  const { getNewToken } = useAuth()

  const axiosInstance = axios.create({
    baseURL: config.app.api.baseUrl,
    headers: {
      'Content-Type': 'application/json',
    },
  })

  // const isAccessTokenExpired = computed(checkTimeExpired(timeExpiredAccess.value))
  axiosInstance.interceptors.request.use(
    async function (config) {
      // Do something before request is sent
      try {
        const isAccessTokenExpired = checkTimeExpired(timeExpiredAccess.value)
        if (isAccessTokenExpired) {
          await getNewToken(refreshToken.value)
        }
        const accessTokenAuth = `${PREFIX_TOKEN}  ${accessToken.value}`
        config.headers.Authorization = accessTokenAuth
      } catch (error) {
        console.log(error)
      }
      return config
    },
    function (error) {
      // Do something with request error
      return error?.data
    },
  )

  // Add a response interceptor
  // axiosInstance.interceptors.response.use(
  //   function (response) {
  //     // Any status code that lie within the range of 2xx cause this function to trigger
  //     // Do something with response data
  //     return response?.data
  //   },
  //   function (error) {
  //     // Any status codes that falls outside the range of 2xx cause this function to trigger
  //     // Do something with response error
  //     return error?.response?.data
  //   },
  // )
  Cinema.setAxiosAuth(axiosInstance)
})
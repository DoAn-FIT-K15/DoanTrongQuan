import { AUTHENTICATION} from '../../constant'

export const useToken = () => {
  const accessToken = useSyncCookieState({
    cookieName: AUTHENTICATION.ACCESS_TOKEN_COOKIE_NAME,

  })

  const timeExpiredAccess = useSyncCookieState({
    cookieName: AUTHENTICATION.ACCESS_TOKEN_EXPIRED_COOKIE_NAME,
  })

  const refreshToken = useSyncCookieState({
    cookieName: AUTHENTICATION.REFRESH_TOKEN_COOKIE_NAME,
  })

  const timeExpiredRefresh = useSyncCookieState({
    cookieName: AUTHENTICATION.REFRESH_TOKEN_EXPIRED_COOKIE_NAME,
  })


  function handleSaveCookieAuth(data = {}) {

    accessToken.value = data.token
    timeExpiredAccess.value = data.timeExpiredToken
    refreshToken.value = data.refreshToken
    timeExpiredRefresh.value = data.timeExpiredRefresh
  }

  return {
    accessToken,
    timeExpiredAccess,
    refreshToken,
    timeExpiredRefresh,
    handleSaveCookieAuth,
  }
}
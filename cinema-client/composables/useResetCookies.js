export const useResetCookies = (cookieName) => {
  return useCookie(cookieName).value = null
}
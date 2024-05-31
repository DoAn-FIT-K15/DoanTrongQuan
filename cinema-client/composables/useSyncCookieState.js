
export const useSyncCookieState = ({ cookieName }) => {
  const valueCookie = useCookie(cookieName)
  const cookie = useState(cookieName, () => valueCookie.value)
  watch(cookie, () => (valueCookie.value = cookie.value))
  return cookie
}
  
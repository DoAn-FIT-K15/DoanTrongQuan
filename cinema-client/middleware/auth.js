export default defineNuxtRouteMiddleware(
  
  async (to, from) => {

  const { accessToken } = useToken()
  const isSignIn = Boolean(accessToken.value)
  const router = useRouter()
  if (!isSignIn) {
    router.replace("/")
  }

}

)

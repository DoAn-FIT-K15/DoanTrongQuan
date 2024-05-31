import { useToken } from '~/composables/authentication/useToken';

export default defineNuxtRouteMiddleware(
  
  async (to, from) => {
  // const profile = useProfileStore()
  // const { getProfile } = useAuth()
  // const hasUser = profile.hasUser
  // const { accessToken } = useToken()
  // const isGuestMode = to?.meta?.auth?.guestPage
  // const isUnauthenticatedOnly = to?.meta.auth?.unauthenticatedOnly
  // if (isGuestMode) return
  // const isSignIn = Boolean(accessToken.value)
  // if (isUnauthenticatedOnly) {
  //   return isSignIn ? navigateTo(appRouter.home.path) : undefined
  // }
  // if (!isSignIn) return navigateTo(appRouter.signin.path)
  // if (!hasUser) getProfile()
  const router = useRouter()
  const { accessToken } = useToken()
  const isSignIn = Boolean(accessToken.value)

  if(!isSignIn) {
    router.replace('/login')
  }
}
)

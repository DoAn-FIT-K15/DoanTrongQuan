export const useProfile = () => {
  

  const userName = useSyncCookieState({
    cookieName: "userName",
    option: {
      default: () => null,
    },
  })
  const role = useSyncCookieState({
    cookieName: "role",
  })

  function handleSaveCookieProfile(data = {}) {

    userName.value = data.userName,
    role.value = data.roles
  }

  return {
    userName,
    role,
    handleSaveCookieProfile
  }

}
export const useProfile = () => {
  const userID = useSyncCookieState({
    cookieName: "userID",
    option: {
      default: () => null,
    },
  }) 

  const userName = useSyncCookieState({
    cookieName: "userName",
    option: {
      default: () => null,
    },
  })
  const phoneNumber = useSyncCookieState({
    cookieName: "phoneNumber",
    option: {
      default: () => null,
    },
  })

  const email = useSyncCookieState({
    cookieName: "email",
    option: {
      default: () => null,
    },
  })

  function handleSaveCookieProfile(data = {}) {
    userID.value = data.id,
    userName.value = data.userName,
    phoneNumber.value = data.phoneNumber,
    email.value = data.email
  }

  return {
    userID,
    userName,
    phoneNumber,
    email,
    handleSaveCookieProfile,
  }

}
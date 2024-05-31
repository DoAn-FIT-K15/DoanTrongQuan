import { login, getAccessTokenByRefreshToken } from "~/repositories/cinema/authRepo";
import { useProfile } from "../useProfile";
import { useToken } from "./useToken"


export const useAuth = () => {
  const { handleSaveCookieAuth, refreshToken } = useToken();
  const { handleSaveCookieProfile } =  useProfile();
  const router  = useRouter()
  const toast  = useToast()
  function logout() {
    //xóa lại tất cả giá trị trong cookie về rỗng
    handleSaveCookieAuth({})
    handleSaveCookieProfile({})
    router.replace('/login')
  }

  onBeforeUnmount(() => {
    
  }
)

  return {

    async login(formData) {
      try {
        const response = await login(formData);
        
        handleSaveCookieAuth(response.data)
        handleSaveCookieProfile(response.data)
        return response
      } catch (error) {
        toast.add({ title: 'Thông tin không chính xác' })
        throw error;
      }
      
    },

    
    async getNewToken() {
      try {
        const response = await getAccessTokenByRefreshToken(refreshToken.value)
        handleSaveCookieAuth(response.data)
      } catch (error) {
        if(error.response.data === 'Refresh token was expired'){
          alert('Hết phiên! Vui lòng đăng nhập')
          logout()
        }
      }
      

    },

    logout

  }
}
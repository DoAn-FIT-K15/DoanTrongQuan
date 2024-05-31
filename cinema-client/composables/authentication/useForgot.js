import { resetPassword } from "~/repositories/cinema/authRepo"
import * as Yup from 'yup';
export const useForgot = () => {

  const toast = useToast()
  const email = ref('')
  const responseError = ref('')
  const isPasswordChanged = ref(false)
  const isLoading = ref(false)

  const schema = Yup.object().shape({
    email: Yup.string().email(responseError || 'Email không đúng định dạng').required('Email là bắt buộc'),
  });

    function clear ()  {
    email.value = ''
    responseError.value = ''
    isPasswordChanged.value = false
    isLoading.value = false
  }

  const onSubmit = async () => {
    isLoading.value = true
    try {
      const res = await resetPassword(email.value)
      // toast.add({ title: `Mật khẩu mới đã gửi tới ${email.value}` })
      isPasswordChanged.value = true
    } catch (error) {
      toast.add({ title: "Thất bại", description: error.response.data })
    }finally {
      isLoading.value = false
    }
  }


  return {
    email,
    responseError,
    schema,
    isPasswordChanged,
    onSubmit,
    clear,
    isLoading
  }
}
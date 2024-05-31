import { resetPassword } from "~/repositories/cinema/authRepo"
import * as Yup from 'yup';
export const useForgot = () => {

  const email = ref('')
  const responseError = ref('')
  const isPasswordChanged = ref(false)
  const isLoading = ref(false)

  const schema = Yup.object().shape({
    email: Yup.string().email(responseError || 'Invalid email').required('Email is required'),
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
      isPasswordChanged.value = true
    } catch (error) {
      responseError.value = error.response.data
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
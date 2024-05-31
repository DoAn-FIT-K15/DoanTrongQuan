import { useAuth } from '~/composables/authentication/useAuth';
import * as Yup from 'yup';
export const useSignup = () => {
  // const toast = useToast();
  // const router = useRouter();

  const authAsync = useAuth()

  const userRegister = reactive({
    fullName: '',
    name: '',
    email: '',
    password: '',
    retypePassword: '',
    phoneNumber: '',
    confirmCode: '',
  });
  const isLoading = ref(false)

  const emailRegistered = reactive(false)
  
  const schema = Yup.object().shape({
    fullName: Yup.string().required('Họ và tên là bắt buộc'),

    name: Yup.string().required('Tên là bắt buộc'),

    email: Yup.string().email('Email không hợp lệ').required('Email là bắt buộc'),

    password: Yup.string()
      .min(3, 'Mật khẩu phải dài ít nhất 3 ký tự')
      .required('Mật khẩu là bắt buộc'),
      
    retypePassword: Yup.string()
      .oneOf([Yup.ref('password'), null], 'Mật khẩu không khớp')
      .required('Xác nhận mật khẩu là bắt buộc'),
    phoneNumber: Yup.string()
      .matches(/^[0-9]+$/, 'Số điện thoại chỉ bao gồm chữ số')
      .required('Số điện thoại là bắt buộc'),
  });
  
  const isDisableGetCode = ref(true);
  const isDisableEmailCode = ref(true);
  
  // Sử dụng computed property để kiểm tra hợp lệ và phản ứng
  const isValidForm = computed(() => {
    try {
      // Xác thực userRegister dựa trên schema
      schema.validateSync(userRegister);
      return true; // Không có lỗi
    } catch (error) {
      return false; // Lỗi xác thực
    }
  });
  
  watch(isValidForm, (newVal) => {
    // Cập nhật trạng thái disabled dựa trên kết quả xác thực
    isDisableGetCode.value = !newVal;
    isDisableEmailCode.value = !newVal;
  });

  async function onSubmit() {
    isLoading.value = true
    try {

      const data = {
        userName:userRegister.fullName,
        name:userRegister.name,
        email:userRegister.email,
        password:userRegister.password,
        retypePassword:userRegister.retypePassword,
        phoneNumber:userRegister.phoneNumber,
        confirmCode:userRegister.confirmCode
      }

      const response = await authAsync.signUp(data)
      isLoading.value = false
      alert(response.data)
    } catch (error) {
      isLoading.value = false
      alert(error.response.data)
    }finally{
      isLoading.value = false;
    }
  }

  async function sendCodeClick(e) {
    isLoading.value = true
    try {
      e.preventDefault();
      const res = await authAsync.sendCodeToEmail(userRegister.email);
      isLoading.value = false
      alert(res.data)
    } catch (error) {
      alert(error.response.data)
    }finally{
      isLoading.value = false
    }
  }

  return {
    userRegister,
    schema,
    isDisableGetCode,
    isDisableEmailCode,
    onSubmit,
    sendCodeClick,
    isLoading
  }

}
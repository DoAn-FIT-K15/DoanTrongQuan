import { useAuth } from '~/composables/authentication/useAuth';
import * as Yup from 'yup';

export const useLogin = () => {
  const router = useRouter()
  const route = useRoute()
  const authAsync = useAuth();



  
  const state = reactive({
    email:'',
    password:''
  })
  
  const schema = Yup.object().shape({
    email: Yup.string().email('Email không đúng định dạng').required('Email là bắt buộc'),

    password: Yup.string()
      .min(3, 'Mật khẩu phải chứa ít nhất 3 ký tự')
      .required('Mật khẩu là bắt buộc'),
  });


  async function onSubmit(event){
    try {
      
      const response = await authAsync.login(event.data);


      let to = route.query.redirect ||'/';   
      
      router.replace(to)

    } catch (error) {
      // alert(error.response.data)
    }
  }

  return {
    state,
    schema,
    onSubmit,
  }
}
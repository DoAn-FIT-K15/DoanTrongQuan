<!-- <template>

  <div class="flex mx-auto min-h-full flex-1 flex-col justify-center px-6 py-12 lg:px-8 max-w-md">
    <div class="sm:mx-auto sm:w-full sm:max-w-sm">
      <img class="mx-auto h-10 w-auto" src="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=600" alt="Your Company" />
      <h2 class="mt-10 text-center text-2xl font-bold leading-9 tracking-tight text-gray-900">Sign in to your account</h2>
    </div>

    <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
      <UForm  :state="state" class="space-y-6" @submit="onSubmit">
        <div>
          <label for="email" class="block text-sm font-medium leading-6 text-gray-900">Email address</label>
          <div class="mt-2">
            <UInput v-model="state.email" size="lg" id="email" name="email" type="email" autocomplete="email" required="" class="block w-full rounded-md border-0  text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" />
          </div>
        </div>

        <div>
          <div class="flex items-center justify-between">
            <label for="password" class="block text-sm font-medium leading-6 text-gray-900">Password</label>
            <div class="text-sm">
              <a href="#" class="font-semibold text-indigo-600 hover:text-indigo-500">Forgot password?</a>
            </div>
          </div>
          <div class="mt-2">
            <UInput v-model="state.password" size="lg" id="password" name="password" type="password" autocomplete="current-password" required="" class="block  w-full rounded-md border-0  text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" />
          </div>
        </div>

        <div>
          <button  type="submit" style ="background-color: rgb(79 70 229 / var(--tw-bg-opacity))" class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Sign in</button>
        </div>
      </UForm>


    </div>
  </div>
</template>

<script setup>

import { useLogin } from '~/composables/authentication/useLogin'

const {  onSubmit, state, schema } = useLogin();
      
definePageMeta({
  layout: false
})


</script> -->



<script setup>
import LoginForm from '~/components/auth/LoginForm.vue';
import { useForgot } from '~/composables/authentication/useForgot'

const {
    email,
    responseError,
    onSubmit,
    schema ,
    isPasswordChanged,
    clear,
    isLoading
  } = useForgot()
/*-For Set Blank Layout-*/
definePageMeta({
  layout: false,
});

eventBus.on('show_forgot_password',(value) => {
  isOpenForgotPassword.value = value
  clear ()
})
const isOpenForgotPassword =ref(false)
</script>
<template>
    <div>
    <!-- <UButton label="Open" @click="isOpen = true" /> -->

    <UModal v-model="isOpenForgotPassword" prevent-close style="padding: 0 !important;" >
      <div class="py-1">
        <div class="py-2 flex justify-end px-2">
            <UButton color="gray" variant="ghost" 
            icon="i-heroicons-x-mark-20-solid" class="-my-1" @click="isOpenForgotPassword = false" />
        </div>
        <div class="flex justify-center ">
            <img src="https://www.galaxycine.vn/_next/static/media/icon-login.fbbf1b2d.svg" alt="">           
        </div>
        <div class = "px-4">
          <h2 style="line-height: 1.75rem;font-size: 1.125rem;font-weight: 700" class="py-2 flex justify-center">Quên mật khẩu?</h2>
          <p v-if = "isPasswordChanged" class = "text-center">Email khôi phục lại mật khẩu đã được gởi lại thành công tới {{ email }}</p>
          <p v-else>Vui lòng cung cấp email đăng nhập, chúng tôi sẽ gửi link kích hoạt cho bạn.</p>
        </div>
        <div class = "py-3 px-4">
          <UForm v-if ="!isPasswordChanged" @submit="onSubmit">
            <UFormGroup v-slot="{ error }"  :error="!email && responseError " >
              <UInput v-model="email" type="email"
              size="xl" style="border: 1px solid black !important;" 
              placeholder="Enter email" :trailing-icon="error ? 'i-heroicons-exclamation-triangle-20-solid' : undefined"
              icon="i-heroicons-envelope">
              </UInput>
          </UFormGroup>
          <button type = "submit" class="mt-4 px-1  bg-[orange] py-2 w-full flex  submit rounded-lg justify-center">
            <v-progress-circular
             class = "z-2"
              v-show = "isLoading"
              color="black"                 
            ></v-progress-circular>
            <span  class="text-white z-1">CẤP LẠI MẬT KHẨU</span>
          </button>
          </UForm>
          <div v-else class = "w-full">
            <button @click="isOpenForgotPassword = false" class = "w-full">ĐÓNG</button>
          </div>
        </div>
      </div>
    </UModal>
  </div>
    <div class="authentication">
        <v-container fluid class="pa-3">
            <v-row class="h-screen d-flex justify-center align-center">
                <v-col cols="12" lg="4" xl="3" class="d-flex align-center">
                    <v-card rounded="md" elevation="10" class="px-sm-1 px-0 withbg mx-auto" max-width="500">
                        <v-card-item class="pa-sm-8">
                            <div class="text-body-1 text-xl text-muted text-center mb-3 ">Đăng nhập</div>
                            <LoginForm />
                        </v-card-item>
                    </v-card>
                </v-col>
            </v-row>
        </v-container>
    </div>
</template>

<style scoped>
.authentication {
  background: radial-gradient(#d2f1df, #d3d7fa, #bad8f4) 0 0 / 400% 400%;
}
</style>
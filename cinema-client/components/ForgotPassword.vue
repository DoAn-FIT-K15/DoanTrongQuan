<script setup>
import eventBus from '~/utils/eventBus'
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
const toast = useToast()
const isOpenForgotPassword =ref(false)

// lấy giá trị true từ login.vue để mở dialog quên mật khẩu
eventBus.on('show_forgot_password',(value) => {
  isOpenForgotPassword.value = value
  clear ()
})
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
              <UInput v-model="email" type="email"
              required
              size="xl" style="border: 1px solid black !important;" 
              placeholder="Email" 
              icon="i-heroicons-envelope">
              </UInput>
          <button type = "submit" class="mt-4 px-1 py-2 w-full submit rounded">
            <v-progress-circular
              v-if = "isLoading"
              color="red"                 
            ></v-progress-circular>
            <p v-else class="text-white mb-0" style="font-size: .875rem">CẤP LẠI MẬT KHẨU</p>
          </button>
          </UForm>
          <div v-else class = "w-full">
            <button @click="isOpenForgotPassword = false" class = "w-full">ĐÓNG</button>
          </div>
        </div>
      </div>
    </UModal>
  </div>
</template>

<style scoped>
/* .v-progress-circular {
  margin: 1rem;
} */

.submit {
  background-color: rgb(245 128 32 / var(--tw-bg-opacity));
}
</style>
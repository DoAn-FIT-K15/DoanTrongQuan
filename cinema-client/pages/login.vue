<template>
  <div>
    <div>
      <ForgotPassword/>
    </div>
    <div class="container-fluid col-12 col-md-8 col-lg-6 col-xl-5 text-center form-signup">
      <UCard class="w-full mt-7">
        <h2>Đăng nhập</h2>
        <UForm :schema="schema" :state="state" class="space-y-4" @submit="onSubmit">
          <UFormGroup size="xl" class="" label="Email" name="email">
            <UInput v-model="state.email" />
          </UFormGroup>

          <UFormGroup size="xl" class="" label="Password" name="password">
            <UInput v-model="state.password" type="password" />
          </UFormGroup>

          <div class="row" style="margin: 5px 5%; margin-top: 15px">
            <a href="#" @click.prevent="OpenForgotPassword" style="text-decoration: none; font-size: 12px"
              >Quên mật khẩu?</a
            >
          </div>
          <button
            type="submit"
            style="
              color: white;
              font-size: 14px;
              font-weight: bold;
              background: #03a9f4;
              width: 100%;
              height: 45px;
              border-radius: 20px;
              margin-left: 0.2px;
            "
          >
            ĐĂNG NHẬP
          </button>
          <div class="text-center">
            Don't Have an acccount?
            <NuxtLink to="/signup" class="no-underline text-black"><span class="cursor-pointer">Sign up</span></NuxtLink>
          </div>
        </UForm>
      </UCard>
    </div>
  </div>
</template>

<script setup>
import { useLogin } from '~/composables/authentication/useLogin'
import ForgotPassword from '~/components/ForgotPassword.vue';
import eventBus from '~/utils/eventBus'

const loginData = useLogin()
const toast = useToast()
const { state, schema, onSubmit } = loginData

//khi sự kiện kích hoạt thì gửi sự kiện show_forgot_password sang component ForgotPassword
const OpenForgotPassword = () => {
  eventBus.emit('show_forgot_password',true)
}

</script>



<style scoped>
.form-signup {
  height: auto;
  margin-left: auto;
  margin-right: auto;
  z-index: 0;
  /* background: white; */
  padding-bottom: 50px;
}
.header {
  position: sticky;
  top: 0;
}

.col-sm-6 a {
  text-decoration: none;
  color: white;
  float: left;
  padding: 5px 5px;
  line-height: 30px;
}

.input-info-register {
  padding-bottom: 0 !important;
  padding-top: 0 !important;
}
.verify-account p {
  margin: 20px 0px;
  position: relative;
  display: block;
  font-size: 0.9rem;
  width: 100%;
  z-index: 100000 !important;
}
</style>


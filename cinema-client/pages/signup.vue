<template>
  <div>
    <div>
         <UModal scroll v-model="isShowPrivatePoli" >
            <template #header>
              <h3>Chính sách bảo mật</h3>
            </template>
            <div class="con-content-scroll">
              <h5>Mục đích và phạm vi truy cập</h5>
              <p>
                Việc thu thập dữ liệu chủ yếu trên website space cinema bao gồm: email, điện thoại, 
                số chứng minh thư nhân dân/căn cước công dân, mật khẩu đăng nhập, địa chỉ khách hàng (thành viên).
                 Đây là các thông tin mà website Space Cinema cần thành viên cung cấp bắt buộc khi đăng ký sử dụng 
                 dịch vụ và để website Betacinemas.vn liên hệ xác nhận khi khách hàng đăng ký sử dụng dịch vụ trên website 
                 Betacinemas.vn nhằm đảm bảo quyền lợi cho người tiêu dùng.
              </p>
            </div>
         </UModal> 
      </div>
      <div class="container-fluid col-12 col-md-9 col-lg-7 col-xl-5 text-center form-signup mt-2">
            <UCard class="w-full mt-4">
              <h3>Đăng ký tài khoản</h3>
              <UForm :schema = "schema" :state="userRegister" class="space-y-4" @submit="onSubmit">
                <div class ="row">
                  <div class="col-md-6 col-12 input-info-register">
                    <UFormGroup size="xl" class="" label="Tên đầy đủ" name="fullName" >
                      <UInput v-model="userRegister.fullName"  />
                    </UFormGroup>
                  </div>
                  <div class="col-md-6 col-12 input-info-register">
                    <UFormGroup size="xl" class="" label="Tên" name="name">
                      <UInput v-model="userRegister.name"  />
                    </UFormGroup>
                  </div>
                </div>

                <div class ="row">
                  <div class = "col-md-6 col-12 input-info-register">
                    <UFormGroup size="xl" class="" label="Email" name="email">
                      <UInput v-model="userRegister.email"  />
                    </UFormGroup>
                  </div>
                  <div class="col-md-6 col-12 input-info-register">
                    <UFormGroup size="xl" class="" label="Số điện thoại" name="phoneNumber">
                      <UInput v-model="userRegister.phoneNumber"  />
                    </UFormGroup>
                  </div>

                </div>

                <div class ="row">
                  <div class="col-md-6 col-12 input-info-register">
                    <UFormGroup size="xl" class="" label="Mật khẩu" name="password">
                      <UInput type ="password" v-model="userRegister.password"  />
                    </UFormGroup>
                  </div>
                  <div class = "col-md-6 col-12 input-info-register">
                    <UFormGroup size="xl" class="" label="Xác nhận mật khẩu" name="retypePassword">
                      <UInput type = "password" v-model="userRegister.retypePassword"  />
                    </UFormGroup>
                  </div>

                </div>

                <div class = "row">
                  <div class = "col-9 input-info-register">
                    <UFormGroup size="xl" class="" label="Mã xác thực" name="confirmCode">
                      <UInput v-model="userRegister.confirmCode"
                      type = "number"
                      :maxLength = "6"
                      :disabled="isDisableEmailCode"

                        />
                    </UFormGroup>
                  </div>
                  <div class="col-3 input-info-register flex flex-col justify-end items-center">
                    <UButton :disabled="isDisableGetCode" @click ="sendCodeClick" style="background:#fda085;color:#000">
                      <div v-if = "isLoading" role="status">
                        <svg aria-hidden="true" class="inline w-4 h-4 text-gray-200 animate-spin dark:text-gray-600 fill-blue-600" viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z" fill="currentColor"/>
                            <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z" fill="currentFill"/>
                        </svg>
                        <span class="sr-only">Loading...</span>
                      </div>
                      <span v-else> Lấy mã</span>
                     </UButton>
                  </div>
                </div>

              <div class="row" style="margin-top: 7px;">
                  <p style="color:#000; font-size:11px; font-style:italic;">(*) Khi bấm vào đăng ký tài khoản, bạn chắc chắn đã đọc và đồng ý với 
                  <a style="color: blue;" href="" @click.prevent = "isShowPrivatePoli  = !isShowPrivatePoli">Chính sách bảo mật, Điều khoản dịch vụ và chính sách tư vấn</a>
                  của khóa hoc.</p>
                </div>
                <div class="row" style="background-image: linear-gradient(to left, #03a8f473 0%, #03a9f4 51%, #606ac1 100%) !important; width:100%;height:45px; border-radius:20px; margin-left:0.2px; margin-top: 10px;">
                  <button  type = "submit" style="color:white; font-size: 14px;line-height: 50px; font-weight:bold">ĐĂNG KÝ</button>
                </div>
              </UForm>
            </UCard>
        </div>
  </div>

</template>

<script setup>

    

const signupData = useSignup();
 
const {
      userRegister,
      schema,
      isDisableGetCode,
      isDisableEmailCode,
      onSubmit,
      sendCodeClick,
      isLoading
     } = signupData;

const isShowPrivatePoli = ref(false);


</script>


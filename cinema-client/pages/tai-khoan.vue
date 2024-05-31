<template>
<div class="container">
  <UModal v-model="isShowChange" prevent-close >
      <div class="generic__modal-wrapper snipcss0-1-1-2 p-8">
          <div class="forget__wrapper snipcss0-2-2-3">
              <div class="login__icon text-center mb-4 snipcss0-3-3-4">
                  <h5 class="text-lg font-bold not-italic py-1 capitalize snipcss0-4-4-5">Chỉnh sửa Mật khẩu</h5>
              </div>
              <div class="forget__form snipcss0-3-3-6">
                  <UForm :state = "password" @submit="onSubmit" class="snipcss0-4-6-7"><label for="password" class="text-xs block font-bold not-italic text-[#777777] snipcss0-5-7-8">Mật khẩu hiện tại</label><span class="w-full mb-1 relative h-auto border inline-flex items-center min-w-0 text-sm bg-white rounded transition-all duration-300 snipcss0-5-7-9"><input v-model ="password.oldPassword" autocomplete="true" type="password" id="password" placeholder="Nhập Mật khẩu hiện tại" class="bg-transparent w-full h-9 focus:ring-2 focus:outline-blue-500 focus:rounded px-2 snipcss0-6-9-10" name="password"><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="eye-slash" class="svg-inline--fa fa-eye-slash text-[#747272] absolute right-2 snipcss0-6-9-11" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                              <path fill="currentColor" d="M38.8 5.1C28.4-3.1 13.3-1.2 5.1 9.2S-1.2 34.7 9.2 42.9l592 464c10.4 8.2 25.5 6.3 33.7-4.1s6.3-25.5-4.1-33.7L525.6 386.7c39.6-40.6 66.4-86.1 79.9-118.4c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C465.5 68.8 400.8 32 320 32c-68.2 0-125 26.3-169.3 60.8L38.8 5.1zM223.1 149.5C248.6 126.2 282.7 112 320 112c79.5 0 144 64.5 144 144c0 24.9-6.3 48.3-17.4 68.7L408 294.5c8.4-19.3 10.6-41.4 4.8-63.3c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3c0 10.2-2.4 19.8-6.6 28.3l-90.3-70.8zM373 389.9c-16.4 6.5-34.3 10.1-53 10.1c-79.5 0-144-64.5-144-144c0-6.9 .5-13.6 1.4-20.2L83.1 161.5C60.3 191.2 44 220.8 34.5 243.7c-3.3 7.9-3.3 16.7 0 24.6c14.9 35.7 46.2 87.7 93 131.1C174.5 443.2 239.2 480 320 480c47.8 0 89.9-12.9 126.2-32.5L373 389.9z"></path>
                          </svg></span><label for="passwordNew" class="text-xs block font-bold not-italic text-[#777777] snipcss0-5-7-12">Mật khẩu mới</label><span class="w-full mb-1 relative h-auto border inline-flex items-center min-w-0 text-sm bg-white rounded transition-all duration-300 snipcss0-5-7-13"><input v-model ="password.newPassword" autocomplete="true" type="password" id="passwordNew" placeholder="Nhập Mật khẩu mới" class="bg-transparent w-full h-9 focus:ring-2 focus:outline-blue-500 focus:rounded px-2 snipcss0-6-13-14" name="passwordNew" aria-autocomplete="list"><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="eye-slash" class="svg-inline--fa fa-eye-slash text-[#747272] absolute right-2 snipcss0-6-13-15" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                              <path fill="currentColor" d="M38.8 5.1C28.4-3.1 13.3-1.2 5.1 9.2S-1.2 34.7 9.2 42.9l592 464c10.4 8.2 25.5 6.3 33.7-4.1s6.3-25.5-4.1-33.7L525.6 386.7c39.6-40.6 66.4-86.1 79.9-118.4c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C465.5 68.8 400.8 32 320 32c-68.2 0-125 26.3-169.3 60.8L38.8 5.1zM223.1 149.5C248.6 126.2 282.7 112 320 112c79.5 0 144 64.5 144 144c0 24.9-6.3 48.3-17.4 68.7L408 294.5c8.4-19.3 10.6-41.4 4.8-63.3c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3c0 10.2-2.4 19.8-6.6 28.3l-90.3-70.8zM373 389.9c-16.4 6.5-34.3 10.1-53 10.1c-79.5 0-144-64.5-144-144c0-6.9 .5-13.6 1.4-20.2L83.1 161.5C60.3 191.2 44 220.8 34.5 243.7c-3.3 7.9-3.3 16.7 0 24.6c14.9 35.7 46.2 87.7 93 131.1C174.5 443.2 239.2 480 320 480c47.8 0 89.9-12.9 126.2-32.5L373 389.9z"></path>
                          </svg></span><label for="confirmPassword" class="text-xs block font-bold not-italic text-[#777777] snipcss0-5-7-16">Xác nhận mật khẩu mới</label><span class="w-full mb-1 relative h-auto border inline-flex items-center min-w-0 text-sm bg-white rounded transition-all duration-300 snipcss0-5-7-17"><input v-model ="password.confirmPassword" autocomplete="true" type="password" id="confirmPassword" placeholder="Xác nhận mật khẩu mới" class="bg-transparent w-full h-9 focus:ring-2 focus:outline-blue-500 focus:rounded px-2 snipcss0-6-17-18" name="confirmPassword"><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="eye-slash" class="svg-inline--fa fa-eye-slash text-[#747272] absolute right-2 snipcss0-6-17-19" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                              <path fill="currentColor" d="M38.8 5.1C28.4-3.1 13.3-1.2 5.1 9.2S-1.2 34.7 9.2 42.9l592 464c10.4 8.2 25.5 6.3 33.7-4.1s6.3-25.5-4.1-33.7L525.6 386.7c39.6-40.6 66.4-86.1 79.9-118.4c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C465.5 68.8 400.8 32 320 32c-68.2 0-125 26.3-169.3 60.8L38.8 5.1zM223.1 149.5C248.6 126.2 282.7 112 320 112c79.5 0 144 64.5 144 144c0 24.9-6.3 48.3-17.4 68.7L408 294.5c8.4-19.3 10.6-41.4 4.8-63.3c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3c0 10.2-2.4 19.8-6.6 28.3l-90.3-70.8zM373 389.9c-16.4 6.5-34.3 10.1-53 10.1c-79.5 0-144-64.5-144-144c0-6.9 .5-13.6 1.4-20.2L83.1 161.5C60.3 191.2 44 220.8 34.5 243.7c-3.3 7.9-3.3 16.7 0 24.6c14.9 35.7 46.2 87.7 93 131.1C174.5 443.2 239.2 480 320 480c47.8 0 89.9-12.9 126.2-32.5L373 389.9z"></path>
                          </svg></span><button  type="submit" class="rounded-md hover:bg-[#e38601] transition-all duration-30 min-w-[135px] w-full focus:outline-none focus:ring-[#e38601] text-sm text-center inline-flex items-center dark:hover:bg-[#e38601] dark:focus:ring-[#e38601] justify-center text-white bg-[#f26b38] h-full px-5 py-2.5 uppercase mt-4 snipcss0-5-7-20"><span class="block snipcss0-6-20-21">Cập nhật mật khẩu mới</span> </button></UForm>
                </div>
            </div>
          </div><button @click = "closeChange" class="react-responsive-modal-closeButton snipcss0-1-1-22" data-testid="close-button"><span class="inline-flex bg-grey-100 rounded-full w-[24px] h-[24px] items-center justify-center snipcss0-2-22-23" data-dismiss="modal" aria-label="Close"><img alt="Detail" loading="lazy" width="30" height="30" decoding="async" data-nimg="1" class="w-[12px] h-[12px] snipcss0-3-23-24 style-JVmyY" src="https://www.galaxycine.vn/_next/static/media/icon-close.7e22f021.svg" id="style-JVmyY"></span></button>

  </UModal>

      <UTabs :items="items" class="w-full">
        <template #item="{ item }">
          <div v-if = "item.key === 'history'" class="space-y-3">
            <div class="overflow-y-auto">
                <v-card>
                <v-data-table
                    :items-per-page-options="[
                    { value: 5, title: '05' },
                    { value: 10, title: '10' },
                    { value: 15, title: '15' },
                    { value: 20, title: '20' },
                    ]"
                    v-model:search="search"
                    :items="historyBill"
                    hover
                    :headers="headersBill"
                >
                </v-data-table>
                </v-card>

                </div>

          </div>
          <div v-else-if="item.key === 'account'" class="space-y-3">
            <UForm>
                <div class="px-4 py-4 md:px-0 lg:px-6 md:py-6 bg-white rounded mt-4 xl:shadow-2xl min-h-[350px] snipcss-6saCH">
                
                    <div class="grid md:grid-cols-2 grid-cols-1 md:gap-4 gap-1">
                        <div class="col-span-1"><label>Họ và tên</label>
                            <div class="w-full my-1 relative h-auto border inline-flex items-center min-w-0 text-[14px] bg-[#ECECEC] rounded-md transition-all duration-300 grayscale opacity-70 cursor-not-allowed"><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="user" class="svg-inline--fa fa-user text-black-30 absolute left-2" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                                    <path fill="currentColor" d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z"></path>
                                </svg><input disabled="" type="text" class="bg-transparent w-full h-9 px-8 focus:ring-2 focus:outline-blue-500 focus:rounded-md grayscale opacity-70 cursor-not-allowed" :value="user.userName"></div>
                        </div>
                        <div class="col-span-1"><label>Email</label>
                            <div class="w-full my-1 relative h-auto border inline-flex items-center min-w-0 text-[14px] bg-[#ECECEC] rounded-md transition-all duration-300 opacity-70"><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="envelope" class="svg-inline--fa fa-envelope text-black-30 absolute left-2" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                    <path fill="currentColor" d="M48 64C21.5 64 0 85.5 0 112c0 15.1 7.1 29.3 19.2 38.4L236.8 313.6c11.4 8.5 27 8.5 38.4 0L492.8 150.4c12.1-9.1 19.2-23.3 19.2-38.4c0-26.5-21.5-48-48-48H48zM0 176V384c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V176L294.4 339.2c-22.8 17.1-54 17.1-76.8 0L0 176z"></path>
                                </svg><input disabled="" type="text" class="bg-transparent w-full h-9 px-8 focus:ring-2 focus:outline-blue-500 focus:rounded-md grayscale opacity-70 " name="email" :value="user.email"><a class="absolute right-2 cursor-pointer grayscale-0 opacity-100 text-primary z-100 text-[12px] font-bold"></a></div>
                        </div>
                        <div class="col-span-1"><label>Số điện thoại</label>
                            <div class="w-full my-1 relative h-auto border inline-flex items-center min-w-0 text-[14px] bg-[#ECECEC] rounded-md transition-all duration-300 grayscale opacity-70 cursor-not-allowed"><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="mobile-button" class="svg-inline--fa fa-mobile-button text-black-30 absolute left-2" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                                    <path fill="currentColor" d="M80 0C44.7 0 16 28.7 16 64V448c0 35.3 28.7 64 64 64H304c35.3 0 64-28.7 64-64V64c0-35.3-28.7-64-64-64H80zM192 400a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"></path>
                                </svg><input disabled="" type="text" class="bg-transparent w-full h-9 px-8 focus:ring-2 focus:outline-blue-500 focus:rounded-md grayscale opacity-70 cursor-not-allowed" :value="user.phoneNumber"></div>
                        </div>
                        <div class="col-span-1"><label>Mật khẩu</label>
                            <div class="w-full my-1 relative h-auto border inline-flex items-center min-w-0 text-[14px] bg-[#ECECEC] rounded-md transition-all duration-300 opacity-70 cursor-not-allowed"><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="lock" class="svg-inline--fa fa-lock text-black-30 absolute left-2" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                                    <path fill="currentColor" d="M144 144v48H304V144c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192V144C80 64.5 144.5 0 224 0s144 64.5 144 144v48h16c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80z"></path>
                                </svg><input disabled="" type="password" class="bg-transparent w-full h-9 px-8 focus:ring-2 focus:outline-blue-500 focus:rounded-md grayscale opacity-70" value="******"><a class="absolute right-2 cursor-pointer grayscale-0 opacity-100 text-primary z-100 text-[12px] font-bold"><span @click.prevent = "showChangePass">Thay đổi</span></a></div>
                        </div>
                    </div>
                    <div class="mt-4 text-right"><button  class="inline-block rounded bg-primary text-white py-2 px-6 w-[120px] h-[40px]">Cập nhật</button></div>
                
              </div>

            </UForm>

          </div>
        </template>
      </UTabs>
</div>
</template>

<script setup>
import { useAuth } from '~/composables/authentication/useAuth';
import { useAuthStore } from '~/stores/user/useAuthStore';
const { onSubmit } = useAuth()


definePageMeta({
    middleware:'auth'
})
const authStore = useAuthStore()
const password = reactive({
  oldPassword:'',
  newPassword:'',
  confirmPassword:''
})
const items = [{
  key: 'history',
  label: 'Hành trình điện ảnh',
}, {
  key: 'account',
  label: 'Thông tin cá nhân',
}]


authStore.getHistoryBillUser()
authStore.getProfileUser()

const historyBill = computed(()=>{
    return authStore.historyBill;
})

const user = computed(()=>{
    return authStore.user;
})
const isShowChange = ref(false)
const showChangePass  = () => {
  console.log(123);
  isShowChange.value =true
}

const closeChange = () => {
  isShowChange.value = false
}

const headersBill = ref([
  { title: "MÃ HÓA ĐƠN", key: "billCode", align: "center" },
  { title: "PHIM", key: "movieName", align: "center" },
  { title: "RẠP CHIẾU", key: "nameOfCinema", align: "center" },
  { title: "XUẤT CHIẾU", key: "schedule", align: "center" },
  { title: "GHẾ ĐÃ ĐẶT", key: "seatSelectedAndTotalMoney", align: "center" },
  { title: "COMBO", key: "comboFood", align: "center" },
  { title: "NGÀY ĐẶT", key: "dateBooking", align: "center" },
]);
</script>

<style scoped>
  body {  
    line-height:1.5;
    font-family:Nunito Sans,sans-serif!important;
    color:#4a4a4a;
    font-weight:400;
  }  
body { 
/* CSS Variables that may have been missed get put on body */ 
    --tw-ring-offset-shadow:  0 0 #0000;  
    --tw-ring-shadow:  0 0 #0000;  
    --tw-shadow:  0 0 #0000;  
    --tw-bg-opacity:  1;  
    --tw-shadow:  0 25px 50px -12px rgba(0,0,0,.25);  
    --tw-shadow-colored:  0 25px 50px -12px var(--tw-shadow-color);  
    --tw-ring-offset-shadow:  0 0 #0000;  
    --tw-ring-shadow:  0 0 #0000;  
    --tw-shadow:  0 0 #0000;  
    --tw-ring-offset-shadow:  0 0 #0000;  
    --tw-ring-shadow:  0 0 #0000;  
    --tw-shadow:  0 0 #0000;  
    --tw-bg-opacity:  1;  
    --tw-text-opacity:  1;  
    --tw-bg-opacity:  1;  
    --tw-grayscale:  grayscale(100%); 
    --tw-text-opacity:  1;  
    --tw-text-opacity:  1;  
    --tw-grayscale:  grayscale(0); 
    --tw-border-opacity:  1;  
    --tw-bg-opacity:  1;  
    --tw-text-opacity:  1;  
    --tw-text-opacity:  1;  
} 

* { 
    box-sizing: border-box; 
    border: 0 solid #e5e7eb;
} 

* { 
    --tw-ring-offset-shadow: 0 0 #0000; 
    --tw-ring-shadow: 0 0 #0000; 
    --tw-shadow: 0 0 #0000; 
} 

@media (min-width: 768px){ 
  .md\:col-span-2 { 
    grid-column: span 2/span 2;
  } 
}     

@media (min-width: 1024px){ 
  .lg\:col-span-2 { 
    grid-column: span 2/span 2;
  } 
}     

.grid-cols-1 { 
    grid-template-columns: repeat(1,minmax(0,1fr));
} 

.px-4 { 
    padding-left: 1rem; 
    padding-right: 1rem;
} 

@media (min-width: 768px){ 
  .md\:grid-cols-4 { 
    grid-template-columns: repeat(4,minmax(0,1fr));
  } 

  .md\:gap-\[30px\] { 
    gap: 30px;
  } 

  .md\:px-\[45px\] { 
    padding-left: 45px; 
    padding-right: 45px;
  } 

  .md\:py-10 { 
    padding-top: 2.5rem; 
    padding-bottom: 2.5rem;
  } 
}     

@media (min-width: 1024px){ 
  .lg\:max-w-5xl { 
    max-width: 64rem;
  } 

  .lg\:grid-cols-3 { 
    grid-template-columns: repeat(3,minmax(0,1fr));
  } 
}     

@media (min-width: 1280px){ 
  .xl\:grid { 
    display: grid;
  } 

  .xl\:max-w-screen-screen1200 { 
    max-width: 1200px;
  } 

  .xl\:gap-16 { 
    gap: 4rem;
  } 

  .xl\:px-0 { 
    padding-left: 0; 
    padding-right: 0;
  } 
}     

@media (min-width: 1390px){ 
  .screen1390\:max-w-screen-xl { 
    max-width: 1280px;
  } 
}     

body { 
    overflow-y: auto;
} 

body { 
    margin: 0; 
    line-height: inherit;
} 

body { 
    font-family: Nunito Sans,sans-serif!important; 
    color: #4a4a4a; 
    font-weight: 400;
} 

body { 
    overflow-x: hidden; 
    overflow-y: auto;
} 

html { 
    line-height: 1.5; 
    -webkit-text-size-adjust: 100%; 
    -moz-tab-size: 4; 
    -o-tab-size: 4; 
    tab-size: 4; 
    font-family: ui-sans-serif,system-ui,-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Arial,Noto Sans,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol,Noto Color Emoji; 
    font-feature-settings: normal; 
    font-variation-settings: normal;
} 

html { 
    font-family: Nunito Sans,sans-serif!important; 
    color: #4a4a4a; 
    font-weight: 400;
} 

.mt-4 { 
    margin-top: 1rem;
} 

.min-h-\[350px\] { 
    min-height: 350px;
} 

.rounded { 
    border-radius: .25rem;
} 

.bg-white { 
    --tw-bg-opacity: 1; 
    background-color: rgb(255 255 255/var(--tw-bg-opacity));
} 

.py-4 { 
    padding-top: 1rem; 
    padding-bottom: 1rem;
} 

@media (min-width: 768px){ 
  .md\:px-0 { 
    padding-left: 0; 
    padding-right: 0;
  } 

  .md\:py-6 { 
    padding-top: 1.5rem; 
    padding-bottom: 1.5rem;
  } 
}     

@media (min-width: 1024px){ 
  .lg\:px-6 { 
    padding-left: 1.5rem; 
    padding-right: 1.5rem;
  } 
}     

@media (min-width: 1280px){ 
  .xl\:shadow-2xl { 
    --tw-shadow: 0 25px 50px -12px rgba(0,0,0,.25); 
    --tw-shadow-colored: 0 25px 50px -12px var(--tw-shadow-color); 
    box-shadow: var(--tw-ring-offset-shadow,0 0 #0000),var(--tw-ring-shadow,0 0 #0000),var(--tw-shadow);
  } 
}     

*,:after,:before { 
    box-sizing: border-box; 
    border: 0 solid #e5e7eb;
} 

*,:after,:before { 
    --tw-ring-offset-shadow: 0 0 #0000; 
    --tw-ring-shadow: 0 0 #0000; 
    --tw-shadow: 0 0 #0000; 
} 

:backdrop { 
    --tw-ring-offset-shadow: 0 0 #0000; 
    --tw-ring-shadow: 0 0 #0000; 
    --tw-shadow: 0 0 #0000; 
} 

.grid { 
    display: grid;
} 

.gap-1 { 
    gap: .25rem;
} 

@media (min-width: 768px){ 
  .md\:grid-cols-2 { 
    grid-template-columns: repeat(2,minmax(0,1fr));
  } 

  .md\:gap-4 { 
    gap: 1rem;
  } 
}     

.text-right { 
    text-align: right;
} 

.col-span-1 { 
    grid-column: span 1/span 1;
} 

button { 
    font-family: inherit; 
    font-feature-settings: inherit; 
    font-variation-settings: inherit; 
    font-size: 100%; 
    font-weight: inherit; 
    line-height: inherit; 
    color: inherit; 
    margin: 0; 
    padding: 0;
} 

button { 
    text-transform: none;
} 

button { 
    cursor: pointer;
} 

[type="submit"],button { 
    -webkit-appearance: button; 
    background-color: transparent; 
    background-image: none;
} 

.inline-block { 
    display: inline-block;
} 

.h-\[40px\] { 
    height: 40px;
} 

.w-\[120px\] { 
    width: 120px;
} 

.bg-primary { 
    --tw-bg-opacity: 1; 
    background-color: rgb(245 128 32/var(--tw-bg-opacity));
} 

.px-6 { 
    padding-left: 1.5rem; 
    padding-right: 1.5rem;
} 

.py-2 { 
    padding-top: .5rem; 
    padding-bottom: .5rem;
} 

.text-white { 
    --tw-text-opacity: 1; 
    color: rgb(255 255 255/var(--tw-text-opacity));
} 

.relative { 
    position: relative;
} 

.my-1 { 
    margin-top: .25rem; 
    margin-bottom: .25rem;
} 

.inline-flex { 
    display: inline-flex;
} 

.h-auto { 
    height: auto;
} 

.w-full { 
    width: 100%;
} 

.min-w-0 { 
    min-width: 0;
} 

.cursor-not-allowed { 
    cursor: not-allowed;
} 

.items-center { 
    align-items: center;
} 

.rounded-md { 
    border-radius: .375rem;
} 

.border { 
    border-width: 1px;
} 

.bg-\[\#ECECEC\] { 
    --tw-bg-opacity: 1; 
    background-color: rgb(236 236 236/var(--tw-bg-opacity));
} 

.text-\[14px\] { 
    font-size: 14px;
} 

.opacity-70 { 
    opacity: .7;
} 

.grayscale { 
    --tw-grayscale: grayscale(100%);
} 

.grayscale { 
    filter: var(--tw-blur) var(--tw-brightness) var(--tw-contrast) var(--tw-grayscale) var(--tw-hue-rotate) var(--tw-invert) var(--tw-saturate) var(--tw-sepia) var(--tw-drop-shadow);
} 

.transition-all { 
    transition-property: all; 
    transition-timing-function: cubic-bezier(.4,0,.2,1); 
    transition-duration: .15s;
} 

.duration-300 { 
    transition-duration: .3s;
} 

.flex { 
    display: flex;
} 

.flex-wrap { 
    flex-wrap: wrap;
} 

.justify-start { 
    justify-content: flex-start;
} 

@media (min-width: 768px){ 
  .md\:mt-8 { 
    margin-top: 2rem;
  } 
}     

svg { 
    display: block; 
    vertical-align: middle;
} 

.svg-inline--fa { 
    display: var(--fa-display,inline-block); 
    height: 1em; 
    overflow: visible; 
    vertical-align: -.125em;
} 

.absolute { 
    position: absolute;
} 

.left-2 { 
    left: .5rem;
} 

.text-black-30 { 
    --tw-text-opacity: 1; 
    color: rgb(116 114 114/var(--tw-text-opacity));
} 

svg:not(:host).svg-inline--fa,svg:not(:root).svg-inline--fa { 
    overflow: visible; 
    box-sizing: content-box;
} 

input { 
    font-family: inherit; 
    font-feature-settings: inherit; 
    font-variation-settings: inherit; 
    font-size: 100%; 
    font-weight: inherit; 
    line-height: inherit; 
    color: inherit; 
    margin: 0; 
    padding: 0;
} 

input { 
    font-size: 16px!important;
} 

:disabled { 
    cursor: default;
} 

.h-9 { 
    height: 2.25rem;
} 

.bg-transparent { 
    background-color: transparent;
} 

.px-8 { 
    padding-left: 2rem; 
    padding-right: 2rem;
} 

a { 
    color: inherit; 
    text-decoration: inherit;
} 

.right-2 { 
    right: .5rem;
} 

.z-100 { 
    z-index: 100;
} 

.cursor-pointer { 
    cursor: pointer;
} 

.text-\[12px\] { 
    font-size: 12px;
} 

.font-bold { 
    font-weight: 700;
} 

.text-primary { 
    --tw-text-opacity: 1; 
    color: rgb(245 128 32/var(--tw-text-opacity));
} 

.opacity-100 { 
    opacity: 1;
} 

.grayscale-0 { 
    filter: var(--tw-blur) var(--tw-brightness) var(--tw-contrast) var(--tw-grayscale) var(--tw-hue-rotate) var(--tw-invert) var(--tw-saturate) var(--tw-sepia) var(--tw-drop-shadow);
} 

.grayscale-0 { 
    --tw-grayscale: grayscale(0);
} 

.mr-4 { 
    margin-right: 1rem;
} 

.pointer-events-none { 
    pointer-events: none;
} 

.h-4 { 
    height: 1rem;
} 

.w-4 { 
    width: 1rem;
} 

.border-gray-300 { 
    --tw-border-opacity: 1; 
    border-color: rgb(209 213 219/var(--tw-border-opacity));
} 

.bg-gray-100 { 
    --tw-bg-opacity: 1; 
    background-color: rgb(243 244 246/var(--tw-bg-opacity));
} 

.text-blue-600 { 
    --tw-text-opacity: 1; 
    color: rgb(37 99 235/var(--tw-text-opacity));
} 

.ml-2 { 
    margin-left: .5rem;
} 

.text-sm { 
    font-size: .875rem;
} 

.font-medium { 
    font-weight: 500;
} 

.text-gray-900 { 
    --tw-text-opacity: 1; 
    color: rgb(17 24 39/var(--tw-text-opacity));
} 
  body {  
    line-height:1.5;
    font-family:Nunito Sans,sans-serif!important;
    color:#4a4a4a;
    font-weight:400;
  }  
body { 
/* CSS Variables that may have been missed get put on body */ 
    --tw-ring-offset-shadow:  0 0 #0000;  
    --tw-ring-shadow:  0 0 #0000;  
    --tw-shadow:  0 0 #0000;  
    --tw-bg-opacity:  1;  
    --tw-shadow:  0 25px 50px -12px rgba(0,0,0,.25);  
    --tw-shadow-colored:  0 25px 50px -12px var(--tw-shadow-color);  
    --tw-ring-offset-shadow:  0 0 #0000;  
    --tw-ring-shadow:  0 0 #0000;  
    --tw-shadow:  0 0 #0000;  
    --tw-ring-offset-shadow:  0 0 #0000;  
    --tw-ring-shadow:  0 0 #0000;  
    --tw-shadow:  0 0 #0000;  
    --tw-bg-opacity:  1;  
    --tw-text-opacity:  1;  
    --tw-bg-opacity:  1;  
    --tw-text-opacity:  1;  
    --tw-bg-opacity:  1;  
    --tw-text-opacity:  1;  
} 

* { 
    box-sizing: border-box; 
    border: 0 solid #e5e7eb;
} 

* { 
    --tw-ring-offset-shadow: 0 0 #0000; 
    --tw-ring-shadow: 0 0 #0000; 
    --tw-shadow: 0 0 #0000; 
} 

@media (min-width: 768px){ 
  .md\:col-span-2 { 
    grid-column: span 2/span 2;
  } 
}     

@media (min-width: 1024px){ 
  .lg\:col-span-2 { 
    grid-column: span 2/span 2;
  } 
}     

@media (min-width: 768px){ 
  .md\:grid-cols-4 { 
    grid-template-columns: repeat(4,minmax(0,1fr));
  } 

  .md\:gap-\[30px\] { 
    gap: 30px;
  } 

  .md\:px-\[45px\] { 
    padding-left: 45px; 
    padding-right: 45px;
  } 

  .md\:py-10 { 
    padding-top: 2.5rem; 
    padding-bottom: 2.5rem;
  } 
}     

@media (min-width: 1024px){ 
  .lg\:max-w-5xl { 
    max-width: 64rem;
  } 

  .lg\:grid-cols-3 { 
    grid-template-columns: repeat(3,minmax(0,1fr));
  } 
}     

@media (min-width: 1280px){ 
  .xl\:grid { 
    display: grid;
  } 

  .xl\:max-w-screen-screen1200 { 
    max-width: 1200px;
  } 

  .xl\:gap-16 { 
    gap: 4rem;
  } 

  .xl\:px-0 { 
    padding-left: 0; 
    padding-right: 0;
  } 
}     

@media (min-width: 1390px){ 
  .screen1390\:max-w-screen-xl { 
    max-width: 1280px;
  } 
}     

body { 
    overflow-y: auto;
} 

body { 
    margin: 0; 
    line-height: inherit;
} 

body { 
    font-family: Nunito Sans,sans-serif!important; 
    color: #4a4a4a; 
    font-weight: 400;
} 

body { 
    overflow-x: hidden; 
    overflow-y: auto;
} 

html { 
    line-height: 1.5; 
    -webkit-text-size-adjust: 100%; 
    -moz-tab-size: 4; 
    -o-tab-size: 4; 
    tab-size: 4; 
    font-family: ui-sans-serif,system-ui,-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Arial,Noto Sans,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol,Noto Color Emoji; 
    font-feature-settings: normal; 
    font-variation-settings: normal;
} 

html { 
    font-family: Nunito Sans,sans-serif!important; 
    color: #4a4a4a; 
    font-weight: 400;
} 

.mt-4 { 
    margin-top: 1rem;
} 

.rounded { 
    border-radius: .25rem;
} 

.bg-white { 
    --tw-bg-opacity: 1; 
    background-color: rgb(255 255 255/var(--tw-bg-opacity));
} 

@media (min-width: 768px){ 
  .md\:px-0 { 
    padding-left: 0; 
    padding-right: 0;
  } 

  .md\:py-6 { 
    padding-top: 1.5rem; 
    padding-bottom: 1.5rem;
  } 
}     

@media (min-width: 1024px){ 
  .lg\:px-6 { 
    padding-left: 1.5rem; 
    padding-right: 1.5rem;
  } 
}     

@media (min-width: 1280px){ 
  .xl\:shadow-2xl { 
    --tw-shadow: 0 25px 50px -12px rgba(0,0,0,.25); 
    --tw-shadow-colored: 0 25px 50px -12px var(--tw-shadow-color); 
    box-shadow: var(--tw-ring-offset-shadow,0 0 #0000),var(--tw-ring-shadow,0 0 #0000),var(--tw-shadow);
  } 
}     

*,:after,:before { 
    box-sizing: border-box; 
    border: 0 solid #e5e7eb;
} 

*,:after,:before { 
    --tw-ring-offset-shadow: 0 0 #0000; 
    --tw-ring-shadow: 0 0 #0000; 
    --tw-shadow: 0 0 #0000; 
} 

:backdrop { 
    --tw-ring-offset-shadow: 0 0 #0000; 
    --tw-ring-shadow: 0 0 #0000; 
    --tw-shadow: 0 0 #0000; 
} 

.react-responsive-modal-modal { 
    max-width: 800px; 
    display: inline-block; 
    text-align: left; 
    vertical-align: middle; 
    background: #fff; 
    box-shadow: 0 12px 15px 0 rgba(0,0,0,.25); 
    margin: 1.2rem; 
    padding: 1.2rem; 
    position: relative; 
    overflow-y: auto;
} 

.react-responsive-modal-modal { 
    animation-fill-mode: forwards!important;
} 

.p-4 { 
    padding: 1rem;
} 

.modal-375 { 
    max-width: 375px; 
    min-width: 315px; 
    border-radius: 4px;
} 

button { 
    font-family: inherit; 
    font-feature-settings: inherit; 
    font-variation-settings: inherit; 
    font-size: 100%; 
    font-weight: inherit; 
    line-height: inherit; 
    color: inherit; 
    margin: 0; 
    padding: 0;
} 

button { 
    text-transform: none;
} 

button { 
    -webkit-appearance: button; 
    background-color: transparent; 
    background-image: none;
} 

button { 
    cursor: pointer;
} 

.react-responsive-modal-closeButton { 
    position: absolute; 
    top: 14px; 
    right: 14px; 
    border: none; 
    padding: 0; 
    cursor: pointer; 
    background-color: transparent; 
    display: flex;
} 

@media (min-width: 768px){ 
  .md\:grid-cols-2 { 
    grid-template-columns: repeat(2,minmax(0,1fr));
  } 

  .md\:gap-4 { 
    gap: 1rem;
  } 
}     

.inline-flex { 
    display: inline-flex;
} 

.h-\[24px\] { 
    height: 24px;
} 

.w-\[24px\] { 
    width: 24px;
} 

.items-center { 
    align-items: center;
} 

.justify-center { 
    justify-content: center;
} 

.rounded-full { 
    border-radius: 9999px;
} 

.bg-grey-100 { 
    --tw-bg-opacity: 1; 
    background-color: rgb(236 236 236/var(--tw-bg-opacity));
} 

img { 
    display: block; 
    vertical-align: middle;
} 

img { 
    max-width: 100%;
} 

img { 
    max-width: auto!important;
} 

img { 
    max-width: auto; 
    height: auto;
} 

.h-\[12px\] { 
    height: 12px;
} 

.w-\[12px\] { 
    width: 12px;
} 

.block { 
    display: block;
} 

.text-xs { 
    font-size: .625rem;
} 

.font-bold { 
    font-weight: 700;
} 

.not-italic { 
    font-style: normal;
} 

.text-\[\#777777\] { 
    --tw-text-opacity: 1; 
    color: rgb(119 119 119/var(--tw-text-opacity));
} 

.relative { 
    position: relative;
} 

.mb-1 { 
    margin-bottom: .25rem;
} 

.h-auto { 
    height: auto;
} 

.w-full { 
    width: 100%;
} 

.min-w-0 { 
    min-width: 0;
} 

.border { 
    border-width: 1px;
} 

.text-sm { 
    font-size: .875rem;
} 

.transition-all { 
    transition-property: all; 
    transition-timing-function: cubic-bezier(.4,0,.2,1); 
    transition-duration: .15s;
} 

.duration-300 { 
    transition-duration: .3s;
} 

[type="submit"],button { 
    -webkit-appearance: button; 
    background-color: transparent; 
    background-image: none;
} 

.h-full { 
    height: 100%;
} 

.min-w-\[135px\] { 
    min-width: 135px;
} 

.rounded-md { 
    border-radius: .375rem;
} 

.bg-\[\#f26b38\] { 
    --tw-bg-opacity: 1; 
    background-color: rgb(242 107 56/var(--tw-bg-opacity));
} 

.px-5 { 
    padding-left: 1.25rem; 
    padding-right: 1.25rem;
} 

.py-2\.5 { 
    padding-top: .625rem; 
    padding-bottom: .625rem;
} 

.text-center { 
    text-align: center;
} 

.uppercase { 
    text-transform: uppercase;
} 

.text-white { 
    --tw-text-opacity: 1; 
    color: rgb(255 255 255/var(--tw-text-opacity));
} 

.hover\:bg-\[\#e38601\]:hover { 
    --tw-bg-opacity: 1; 
    background-color: rgb(227 134 1/var(--tw-bg-opacity));
} 

input { 
    font-family: inherit; 
    font-feature-settings: inherit; 
    font-variation-settings: inherit; 
    font-size: 100%; 
    font-weight: inherit; 
    line-height: inherit; 
    color: inherit; 
    margin: 0; 
    padding: 0;
} 

input { 
    font-size: 16px!important;
} 

.h-9 { 
    height: 2.25rem;
} 

.bg-transparent { 
    background-color: transparent;
} 

.px-2 { 
    padding-left: .5rem; 
    padding-right: .5rem;
} 

svg { 
    display: block; 
    vertical-align: middle;
} 

.svg-inline--fa { 
    display: var(--fa-display,inline-block); 
    height: 1em; 
    overflow: visible; 
    vertical-align: -.125em;
} 

.absolute { 
    position: absolute;
} 

.right-2 { 
    right: .5rem;
} 

.text-\[\#747272\] { 
    --tw-text-opacity: 1; 
    color: rgb(116 114 114/var(--tw-text-opacity));
} 

svg:not(:host).svg-inline--fa,svg:not(:root).svg-inline--fa { 
    overflow: visible; 
    box-sizing: content-box;
} 


/* These were inline style tags. Uses id+class to override almost everything */
#style-RxAZV.style-RxAZV {  
   animation: 300ms ease 0s 1 normal none running react-responsive-modal-modal-in;  
}  
#style-JVmyY.style-JVmyY {  
   color: transparent;  
}  

</style>
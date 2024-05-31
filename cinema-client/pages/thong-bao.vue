<template>
<div v-if = "route.query.status === 'success'" class="bg-gray-100 h-screen">
      <div class="p-6  md:mx-auto">
        <svg viewBox="0 0 24 24" class="text-green-600 w-16 h-16 mx-auto my-6">
            <path fill="currentColor"
                d="M12,0A12,12,0,1,0,24,12,12.014,12.014,0,0,0,12,0Zm6.927,8.2-6.845,9.289a1.011,1.011,0,0,1-1.43.188L5.764,13.769a1,1,0,1,1,1.25-1.562l4.076,3.261,6.227-8.451A1,1,0,1,1,18.927,8.2Z">
            </path>
        </svg>
        <div class="text-center">
            <h3 class="md:text-2xl text-base text-gray-900 font-semibold text-center">Đặt vé thành công!</h3>
            <p class="text-gray-600 my-2">Cảm ơn bạn đã lựa chọn space cinema! Kiểm tra email để xác nhận hóa đơn</p>
            <p> Chúc bạn có một ngày tốt lành!  </p>
            <div class="py-10 text-center">
                <a href="/home" class="px-12 bg-indigo-600 hover:bg-indigo-500 text-white font-semibold py-3">
                    Quay lại
               </a>
            </div>
        </div>
    </div>
  </div>
  <div v-else class="h-screen">
    <div class="bg-white p-6 md:mx-auto">
      <svg viewBox="0 0 24 24" class="text-red-600 w-16 h-16 mx-auto my-6">
        <path fill="currentColor"
          d="M12,2A10,10,0,1,0,22,12,10,10,0,0,0,12,2Zm5,13a.99943.99943,0,0,1-1.41406,0L12,13.41406l-3.58594,3.58594A.99943.99943,0,0,1,7,15.58594L10.58594,12,7,8.41406A.99989.99989,0,0,1,8.41406,7L12,10.58594l3.58594-3.58594A.99989.99989,0,0,1,17,8.41406L13.41406,12Z"></path>
      </svg>
      <div class="text-center">
        <h3 class="md:text-2xl text-base text-gray-900 font-semibold text-center">Đặt vé thất bại!</h3>
        <p class="text-gray-600 my-2">Xin lỗi, đã có lỗi xảy ra trong quá trình thanh toán.</p>
        <p>Vui lòng thử lại hoặc liên hệ hỗ trợ nếu cần.</p>
        <div class="py-10 text-center">
          <a href="/home" class="px-12 bg-red-600 hover:bg-red-500 text-white font-semibold py-3">
            Quay lại
          </a>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
const status = ref('')
const route = useRoute()

definePageMeta({
  layout:'custom', 
})
onMounted(() => {
    // status.value = route.query.status
})
</script>

<style>

</style>
<template>
    <UDashboardPage>
      <UModal v-model="isShowDeleteBill" class="w-full" prevent-close>
        <div class="py-1 px-4">
          <div class="py-2 flex justify-end">
            <UButton
              color="gray"
              variant="ghost"
              icon="i-heroicons-x-mark-20-solid"
              class="-my-1"
              @click="isShowDeleteBill = false"
            />
          </div>
          <div class="py-3 px-3">
            <h1 class="text-2xl font-sans text-center font-semibold pb-3">
              Xóa hóa đơn theo thời gian
            </h1>
            <UForm :state="deleteBill" class="space-y-6" @submit="onSubmit">
              <div class="grid grid-cols-4 gap-2 mt-5">
                <p class="col-span-1">Bắt đầu</p>
                <input class="col-span-2" v-model = "deleteBill.start" type="datetime-local">
              </div>
              <div class="grid grid-cols-4 gap-2 mt-5">
                <p class="col-span-1">Kết thúc</p>
                <input class="col-span-2" v-model = "deleteBill.end" type="datetime-local">
              </div>
              <div class="w-full flex justify-center">
                <UButton type = "submit">Xác nhận</UButton> 
                <button @click = "check">Check</button>
              </div>
              
            </UForm>
          </div>
        </div>
      </UModal>
<UDashboardPanel grow>
  <UDashboardNavbar title="Quản lí rạp chiếu phim"  class="text-2xl"/>

<div class="overflow-y-auto">
  <v-card>
  <v-card-title class="d-flex align-center pe-2">
    <v-spacer></v-spacer>

    <v-text-field
      density="compact"
      label="Tìm kiếm hóa đơn"
      v-model="search"
      prepend-inner-icon="mdi-magnify"
      variant="solo-filled"
      flat
      hide-details
      single-line
    ></v-text-field>
    <div class = "mx-5">
    <UButton @click="removeAll">Dọn dẹp</UButton>
  </div>
  </v-card-title>

  <v-divider></v-divider>
  <v-data-table
    :items-per-page-options="[
      { value: 5, title: '05' },
      { value: 10, title: '10' },
      { value: 15, title: '15' },
      { value: 20, title: '20' },
    ]"
    v-model:search="search"
    :items="bills"
    hover
    :headers="headersBill"
  >
    <template v-slot:item.status="{ item }">
      <div class="text-end">
        <v-chip
          :color="item.status === 2 ? 'green' : 'red'"
          :text="item.status === 2 ? 'Đã thanh toán' :'Chưa thanh toán' "
          class="text-uppercase"
          size="small"
          label
        ></v-chip>
      </div>
    </template>
  </v-data-table>
</v-card>

</div>
  
</UDashboardPanel>
</UDashboardPage>
</template>

<script setup>
import { useBillStore } from "~/stores/admin/useBillStore";
import { format,parseISO } from 'date-fns'

const billStore = useBillStore()

const bills = computed(() => {
    return billStore.bills;
})
const search = ref('')
const isShowDeleteBill = ref(false)

const deleteBill = ref({
  start:'',
  end:''
})

billStore.getAllBill()

const headersBill = ref([
  { title: "Mã hóa đơn", key: "tradingCode", align: "center" },
  {
    title: "Tên hóa đơn",
    align: "center",
    key: "name",
    sortable: false,
    class: "bold-title",
  },
  { title: "Người dùng", key: "user", align: "center" },
  { title: "Tổng tiền (VNĐ)", key: "totalMoney", align: "center" },
  { title: "Ngày tạo", key: "createTime", align: "center" },
  { title: "Trạng thái", key: "status", align: "center" },
]);

const check = () => {

  console.log(deleteBill.value.start)
  console.log(deleteBill.value.end)
  }
  const removeAll  = () =>{
  isShowDeleteBill.value = true;
}

const onSubmit = () => {
    

}
</script> 

<style>

</style>


  
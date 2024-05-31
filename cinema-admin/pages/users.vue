<script  setup>
import { useUserStore } from '~/stores/admin/useUserStore';

const userStore = useUserStore()

userStore.getAllUser()

const users = computed(() => {
  return userStore.users;
})
const search = ref('');

const check  = () => {
  console.log(users.value)
}

const  showConfirmAuthor = (email) => {
  newRoleUser.value.newEmail = email
  isShowConfirm.value = true
}

const newRoleUser = ref({
  password:'',
  newEmail:''
})
const isShowConfirm = ref(false)

const close = () => {
  isShowConfirm.value = false
}
const password = ref('')

const confirmAuthor  = () => {
  userStore.confirmAuthor(newRoleUser.value)
}

</script>

<template>
  <UDashboardPage>
    <div>
      <UModal class="p-3" v-model="isShowConfirm" prevent-close>
        <UCard :ui="{ ring: '', divide: 'divide-y divide-gray-100 dark:divide-gray-800' }">
          <template #header>
            <div class="flex items-center  justify-between">
              <h3 class="text-base justify-center font-semibold leading-6 text-gray-900 dark:text-white">
                Xác nhận quyền truy cập
              </h3>
              <UButton color="gray" variant="ghost" icon="i-heroicons-x-mark-20-solid" class="-my-1" @click="close" />
            </div>
          </template>

          <UInput type="password" v-model="newRoleUser.password" placeholder="Mật khẩu"/>
          <div class="mx-auto mt-3 text-center" >
            <UButton @click = "confirmAuthor">Xác nhận</UButton>
          </div>
          
        </UCard>
      </UModal>
    </div>
    <UDashboardPanel grow>
      <UDashboardNavbar
        title="Quản lí người dùng"
        :badge="users.length"
      >
      </UDashboardNavbar>
      <v-card flat>
        <v-card-title class="d-flex align-center pe-2">
          <v-spacer></v-spacer>

          <v-text-field
            density="compact"
            v-model="search"
            label="Tìm kiếm người dùng"
            prepend-inner-icon="mdi-magnify"
            variant="solo-filled"
            flat
            hide-details
            single-line
          ></v-text-field>
        </v-card-title>

        <v-divider></v-divider>
        <v-data-table :items-per-page-options="[
          { value: 5, title: '05' },
          { value: 10, title: '10' },
          { value: 15, title: '15' },
          { value: 20, title: '20' }
          ]" v-model:search="search" :items="users">
          <template v-slot:item.role="{ item }">
            <div class="flex">
            {{ item.role }}
             <UPopover mode="hover" >
                <v-icon @click = "showConfirmAuthor(item.email)" color ="blue-darken-2" icon="mdi mdi-pencil-box-outline"></v-icon>
              <template #panel>
                <div class="p-1">
                  Bạn có chắn chắn muốn nhượng quyền quản trị viên!
                </div>
              </template>
             </UPopover>
            </div>     
          </template>
          <template v-slot:item.isActive="{ item }">
            <div class="">
              <v-chip
                :color="item.isActive ? 'green' : 'red'"
                :text="item.isActive? 'Đã kích hoạt' : 'Đã khóa'"
                class="text-uppercase"
                size="small"
                label
              ></v-chip>
            </div>
          </template>
        </v-data-table>
      </v-card>
    </UDashboardPanel>
  </UDashboardPage>
</template>

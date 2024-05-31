<template>
  <UDashboardPage>
    <UDashboardPanel grow>
      <UDashboardNavbar title="Quản lí Sự kiện, Khuyến mãi"  class="text-2xl"/>
      <div class="overflow-y-auto">
        <v-card flat>
          <v-card-title class="d-flex align-center pe-2">
            <v-spacer></v-spacer>

            <v-text-field
              density="compact"
              label="Tìm kiếm sự kiện, khuyến mãi"
              v-model="search"
              prepend-inner-icon="mdi-magnify"
              variant="solo-filled"
              flat
              hide-details
              single-line
            ></v-text-field>
            <div class = "mx-5">
            <NuxtLink to="/event/add-promotion"><UButton>Thêm khuyễn mãi</UButton></NuxtLink>
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
            :items="promotions"
            hover
            :headers="headerPromotion"
          >
            <template v-slot:item.image="{ item }">
              <v-card class="my-2" elevation="2" rounded>
                <v-img :src="item.image" height="64" cover></v-img>
              </v-card>
            </template>
            <template v-slot:item.isActive="{ item }">
              <div class="text-end">
                <v-chip
                  :color="item.active ? 'green' : 'red'"
                  :text="item.active ? 'Đang hoạt động':'Ngừng hoạt động'"
                  class="text-uppercase"
                  size="small"
                  label
                ></v-chip>
              </div>
            </template>
            <template v-slot:item.action="{ item }">
              <v-icon
                size="small"
                color="red"
                class="me-2"
                @click="editFood(item.id)"
              >
                mdi-pencil
              </v-icon>
            </template>
          </v-data-table>
        </v-card>
      </div>
    </UDashboardPanel>
  </UDashboardPage>
</template>

<script setup>
import { usePromotionStore } from '~/stores/admin/usePromotionStore';


const promotionStore = usePromotionStore();

//lấy dữ liệu
promotionStore.getAllPromotion()

const promotions = computed(() => {
  return promotionStore.promotions;
})

const headerPromotion = ref([
  { title: "Hình ảnh", key: "image", align: "center" },
  {
    title: "Tên",
    align: "center",
    key: "name",
    sortable: false,
    class: "bold-title",
  },
  { title: "Mã Code", key: "code", align: "center" },
  { title: "Giảm giá", key: "percent", align: "center" },
  { title: "Số lượng", key: "quantity", align: "center" },
  { title: "Ngày bắt đầu", key: "startTime", align: "center" },
  { title: "Ngày kết thúc", key: "endTime", align: "center" },
  { title: "Tình trạng", key: "isActive", align: "center" },
  { title: "Tác vụ", key: "action", align: "center" },
]);
</script>

<style>

</style>
<template>
      <div class="w-full" style="width: 700px !important">
    <UModal v-model="isShowCreateFood" class="w-full" prevent-close>
      <div class="py-1 px-4">
        <div class="py-2 flex justify-end">
          <UButton
            color="gray"
            variant="ghost"
            icon="i-heroicons-x-mark-20-solid"
            class="-my-1"
            @click="isShowCreateFood = false"
          />
        </div>
        <div class="py-3 px-3">
          <h1 class="text-2xl font-sans text-center font-semibold pb-3">
            Thêm đồ ăn
          </h1>
          <form  class="space-y-6">
            <div class ="grid grid-cols-3">
                <p class = "col-span-1">Hình ảnh</p>
                <v-file-input class="col-span-2" density = "compact" v-model="newFood.image.name" label="File input" variant="outlined"></v-file-input>
            </div>
            <div class ="grid grid-cols-3">
                <p class = "col-span-1">Tên combo</p>
                <UInput required class = "col-span-2" v-model="newFood.nameOfFood"></UInput>
            </div>
            <div class ="grid grid-cols-3">
                <p class = "col-span-1">Mô tả</p>
                <UTextarea
                required
                class = "col-span-2"
                v-model="newFood.description"
                :rows="5"
                autoresize
                size="md"
            />
            </div>
            <div class ="grid grid-cols-3">
                <p class = "col-span-1">Giá</p>
                <UInput required class = "col-span-2" v-model="newFood.price"></UInput>
            </div>
            <div class="w-full flex justify-center">
               <UButton @click.prevent = "createFood">Thêm</UButton> 
            </div>
        </form>
        </div>
      </div>
    </UModal>
  </div>
  <div class="w-full" style="width: 700px !important">
    <UModal v-model="isShowEditFood" class="w-full" prevent-close>
      <div class="py-1 px-4">
        <div class="py-2 flex justify-end">
          <UButton
            color="gray"
            variant="ghost"
            icon="i-heroicons-x-mark-20-solid"
            class="-my-1"
            @click="closeFood"
          />
        </div>
        <div class="py-3 px-3">
          <h1 class="text-2xl font-sans text-center font-semibold pb-3">
            Chỉnh sửa combo đồ ăn
          </h1>
          <UForm :state="foodDetail" class="space-y-6" @submit="onSubmit">
            <div class ="grid grid-cols-3">
                <p class = "col-span-1">Hình ảnh</p>
                <v-file-input class="col-span-2" density = "compact" v-model="foodDetail.image" label="File input" variant="outlined"></v-file-input>
            </div>
            <div class ="grid grid-cols-3">
                <p class = "col-span-1">Tên combo</p>
                <UInput class = "col-span-2" v-model="foodDetail.foodName"></UInput>
            </div>
            <div class ="grid grid-cols-3">
                <p class = "col-span-1">Mô tả</p>
                <UTextarea
                class = "col-span-2"
                v-model="foodDetail.description"
                :rows="5"
                autoresize
                size="md"
            />
            </div>
            <div class ="grid grid-cols-3">
                <p class = "col-span-1">Giá</p>
                <UInput class = "col-span-2" v-model="foodDetail.price"></UInput>
            </div>
            <div class ="grid grid-cols-3">
                <p class = "col-span-1">Số lượng</p>
                <UInputMenu class="col-span-2" v-model="foodDetail.isActive" :options="showTime" />
            </div>
            <div class="w-full flex justify-center">
               <UButton type = "submit">Xác nhận</UButton> 
            </div>
          </UForm>
        </div>
      </div>
    </UModal>
  </div>
  <div class="overflow-y-auto">
    <v-card flat>
      <v-card-title class="d-flex align-center pe-2">
        <v-spacer></v-spacer>

        <v-text-field
          density="compact"
          label="Tìm kiếm đồ ăn"
          v-model="search"
          prepend-inner-icon="mdi-magnify"
          variant="solo-filled"
          flat
          hide-details
          single-line
        ></v-text-field>
        <div class = "mx-5">
        <UButton @click="addFood">Thêm đồ ăn</UButton>
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
        :items="foods"
        hover
        :headers="headersFood"
      >
        <template v-slot:item.image="{ item }">
          <v-card class="my-2" elevation="2" rounded>
            <v-img :src="item.image" height="64" cover></v-img>
          </v-card>
        </template>
        <template v-slot:item.isActive="{ item }">
          <div class="text-end">
            <v-chip
              :color="item.isActive === 'Còn hàng' ? 'green' : 'red'"
              :text="item.isActive"
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
</template>

<script setup>
import { useFoodStore } from "~/stores/admin/useFoodStore";

const foodStore = useFoodStore();

foodStore.getAllFood();

const search = ref("");
const isShowEditFood = ref(false);
const isShowCreateFood = ref(false)

const foods = computed(() => {
  return foodStore.foods;
});

const foodDetail = computed(()=>{
    return foodStore.foodDetail;
})
const newFood = ref({
    price:'',
    description:'',
    image:'',
    nameOfFood:''
})
const isLoading = computed(() => {
    return foodStore.isLoading;
})
const headersFood = ref([
  { title: "Combo", key: "image", align: "center" },
  {
    title: "Tên Combo",
    align: "center",
    key: "foodName",
    sortable: false,
    class: "bold-title",
  },
  { title: "Mô tả", key: "description", align: "center" },
  { title: "Giá (VNĐ)", key: "price", align: "center" },
  { title: "Trạng thái", key: "isActive", align: "center" },
  { title: "Tác vụ", key: "action", align: "center" },
]);
const showTime = ['Còn hàng','Hết hàng']
const editFood = (item) => {
    console.log(item)
  isShowEditFood.value = true;
  foodStore.getFoodByAdmin(item);

};

const closeFood = () => {
   isShowEditFood.value = false
}

const onSubmit = async(event) => {
  const data = {
    image:event.data.image.name,
    foodName:event.data.foodName,
    description:event.data.description,
    price:event.data.price,
    isActive:event.data.isActive
    }
foodStore.updateFood(data)

}
const addFood = () =>{
    isShowCreateFood.value = true
}

const createFood = () => {
    foodStore.createFood(newFood.value)
}
</script>

<style>
</style>
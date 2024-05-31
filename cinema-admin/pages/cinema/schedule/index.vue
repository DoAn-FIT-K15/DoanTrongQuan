<template>
<div class="overflow-y-auto">
  <div class="w-full" style="width: 700px !important;">
    <UModal v-model="isShowSchedule" class="w-full" prevent-close >
        <div class="py-1 px-4" >
            <div class="py-2 flex justify-end">
                <UButton color="gray" variant="ghost" 
                icon="i-heroicons-x-mark-20-solid" class="-my-1" @click="closeSchedule" />
            </div>
            <div class="py-3 px-3">
                <h1 class="text-2xl font-sans text-center font-semibold">Thêm lịch chiếu</h1>
                <UForm  :state="actor" class="space-y-6" @submit="onSubmit">
                    <div class="grid grid-cols-4 gap-2 mt-5">
                        <p class="col-span-1">Phim</p>
                        <USelectMenu
                        class="col-span-3"
                        v-model="scheduleNew.movieSelected"
                        :options="movies"
                        placeholder="Tìm phim"
                        searchable
                        searchable-placeholder="Tìm phim theo tên"
                        option-attribute="name"
                        by="id"
                        :search-attributes="['name']"
                      >
                      </USelectMenu>
                    </div>
                    <div class="grid grid-cols-4 gap-2 mt-5">
                        <p class="col-span-1">Phòng chiếu</p>
                        <USelectMenu
                        class="col-span-3"
                        v-model="scheduleNew.roomsSelected"
                        :options="rooms"
                        placeholder="Tìm phòng chiếu"
                        searchable
                        searchable-placeholder="Tìm phòng theo tên"
                        option-attribute="roomName"
                        by="id"
                        :search-attributes="['roomName']"
                      >
                      </USelectMenu>
                    </div>
                    <div class="grid grid-cols-4 gap-2 mt-5">
                        <p class="col-span-1">Giờ bắt đầu</p>
                        <input class="col-span-2" v-model = "scheduleNew.startAt" type="datetime-local" :min = "currentTime">
                    </div>
                    <div class="grid grid-cols-4 gap-2 mt-5">
                        <p class="col-span-1">Giờ kết thúc</p>
                        <input class="col-span-2" v-model = "scheduleNew.endTime" type="datetime-local">
                    </div>
                    <div class="grid grid-cols-4 gap-2">
                      <p class="col-span-1">Tên</p>
                      <UInput
                        v-model= "scheduleNew.name"
                        class ="col-span-3 w-full"
                        autocomplete="off"
                        size="md"
                      />
                    </div>

                    <div class="grid grid-cols-4 gap-2">
                      <p class = "col-span-1">Mã code</p>
                      <UInput
                        v-model= "scheduleNew.code"
                        class ="col-span-3"
                        autocomplete="off"
                        size="md"
                      />
                    </div>

                  <div
                    class="grid grid-cols-4 gap-2"
                  >
                    <p class="col-span-1">Giá</p>
                    <UInput
                      v-model= "scheduleNew.price"
                      class ="col-span-3"
                      autocomplete="off"
                      size="md"

                    >
                    </UInput>
                  </div>
                    <UButton @click = "createSchedule">Thêm mới</UButton>
                    <!-- <UButton @click = "check">check</UButton> -->
                </UForm>

            </div>

        </div>

    </UModal>
    <UModal v-model="isShowDeleteSchedule" class="w-full" prevent-close>
        <div class="py-1 px-4">
          <div class="py-2 flex justify-end">
            <UButton
              color="gray"
              variant="ghost"
              icon="i-heroicons-x-mark-20-solid"
              class="-my-1"
              @click="isShowDeleteSchedule = false"
            />
          </div>
          <div class="py-3 px-3">
            <h1 class="text-2xl font-sans text-center font-semibold pb-3">
              Xóa lịch chiếu theo thời gian
            </h1>
            <UForm :state="deleteshce" class="space-y-6" @submit="onSubmit">
              <div class="grid grid-cols-4 gap-2 mt-5">
                <p class="col-span-1">Bắt đầu</p>
                <input class="col-span-2" v-model = "deleteshce.start" type="datetime-local">
              </div>
              <div class="grid grid-cols-4 gap-2 mt-5">
                <p class="col-span-1">Kết thúc</p>
                <input class="col-span-2" v-model = "deleteshce.end" type="datetime-local">
              </div>
              <div class="w-full flex justify-center">
                <UButton type = "submit">Xác nhận</UButton> 
              </div>
            </UForm>
          </div>
        </div>
      </UModal>
  </div>
  <v-card flat>
    <v-card-title class="d-flex align-center pe-2">
      <v-icon icon="mdi mdi-calendar-month-outline"></v-icon> &nbsp;
      Quản lí lịch chiếu

      <v-spacer></v-spacer>

      <v-text-field
        class = "mx-4"
        v-model="search"
        density="compact"
        label="Tìm kiếm"
        prepend-inner-icon="mdi-magnify"
        variant="solo-filled"
        flat
        hide-details
        single-line
      ></v-text-field>
      <div class = "mx-5">
        <UButton @click="addSchedule">Thêm lịch chiếu</UButton>
      </div>
      <div>
        <UButton color ="red" @click="deleteSchedule">Gỡ lịch chiếu</UButton>
      </div>
    </v-card-title>

    <v-divider></v-divider>
    <v-data-table  :items-per-page-options="[
    { value: 5, title: '05' },
    { value: 10, title: '10' },
    { value: 15, title: '15' },
    { value: 20, title: '20' }
    ]" v-model:search="search" :items="schedules">
    </v-data-table>
  </v-card>

</div>
</template>

<script setup>
import { useScheduleStore } from '~/stores/admin/useScheduleStore';
import EditSchedule from '~/components/schedule/EditSchedule.vue'
import { format,parseISO } from 'date-fns'


const scheduleStore = useScheduleStore()


scheduleStore.getAllMovieSchedule()
scheduleStore.getAllRoomSchedule()
scheduleStore.getAllSchedule()



const isShowSchedule = ref(false)
const isShowDeleteSchedule = ref(false)


const movies = computed(() => {
  return scheduleStore.movies
})

const rooms = computed(() => {
  return scheduleStore.rooms
})

const schedules = computed(() => {
    return scheduleStore.schedules
})

const currentTime = new Date()

const scheduleNew = reactive({
  movieSelected:  {},
  roomsSelected: {},
  startAt:'',
  endTime:'',
  name:'',
  code:'',
  price:0
})

const deleteshce  = ref({
  start:'',
  end:''
})
const search = ref('');

  const addSchedule = () => {
    isShowSchedule.value = true;
  }

const createSchedule = () => {
  const data = {
    movie:  scheduleNew.movieSelected.id,
    room: scheduleNew.roomsSelected.id,
    startAt: format(parseISO(scheduleNew.startAt), "yyyy-MM-dd HH:mm:ss.SSSSSS"),
    endTime: format(parseISO(scheduleNew.endTime), "yyyy-MM-dd HH:mm:ss.SSSSSS"),
    name: scheduleNew.name,
    code: scheduleNew.code,
    price: scheduleNew.price
  }
  scheduleStore.createSchedule(data)
}

const onSubmit = () => {
  console.log(deleteshce.value.start)
       scheduleStore.deleteScheduleByAdmin(deleteshce.value)
}

const deleteSchedule = () => {
  isShowDeleteSchedule.value = true 
  
}

const check = () => {
  console.log(deleteshce.value.start)
}


  const closeSchedule = () => {
    alert('Những thay đổi chưa được lưu')
    isShowSchedule.value = false;
  }


</script>


<style>

</style>
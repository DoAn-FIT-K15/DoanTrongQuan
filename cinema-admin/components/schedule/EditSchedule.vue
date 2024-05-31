<template>
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
                        v-model="movieSelected"
                        :options="movies"
                        placeholder="Tìm phim"
                        searchable
                        searchable-placeholder="Tìm phim theo tên"
                        option-attribute="movieName"
                        by="id"
                        :search-attributes="['movieName']"
                      >
                      </USelectMenu>
                    </div>
                    <div class="grid grid-cols-4 gap-2 mt-5">
                        <p class="col-span-1">Phòng chiếu</p>
                        <UInput required class="col-span-3" v-model="actor.name"  size="sm" />
                    </div>
                    <div class="grid grid-cols-4 gap-2 mt-5">
                        <p class="col-span-1">Chiều cao</p>
                        <UInput required class="col-span-3" v-model="actor.height"  size="sm" />
                    </div>
                    <div class="grid grid-cols-4 gap-2 mt-5">
                        <p class="col-span-1">Giới tính</p>
                        <UInputMenu required v-model="actor.gender" :options="showGender" />
                    </div>
                    <div class="grid grid-cols-4 gap-2 mt-5">
                        <p class="col-span-1">Ngày sinh</p>
                        <UInput required class="col-span-3" v-model="actor.birthDay"  size="sm" />
                    </div>
                    <div class="grid grid-cols-4 gap-2 mt-5">
                        <p class="col-span-1">Mô tả</p>
                        <UInput required class="col-span-3" v-model="actor.description"ize="sm" />
                    </div>
                    <div class="grid grid-cols-4 gap-2 mt-5">
                        <p class="col-span-1">Quốc gia</p>
                        <UInput required class="col-span-3" v-model="actor.nationality" size="sm" />
                    </div>
                    <div class="grid grid-cols-4 gap-2 mt-5">
                        <p class="col-span-1">Đường dẫn</p>
                        <UInput required class="col-span-3" v-model ="actor.slug" size="sm" />
                    </div>
                    <div class="mt-3 text-center">
                        <UButton type ="submit" class="mt-3"  size="sm">Thêm mới</UButton> 
                    </div>     
                </UForm>

            </div>

        </div>

    </UModal>
  </div>
</template>

<script setup>
import eventBus from '~/utils/eventBus'
import { useActorStore } from '~/stores/admin/useActorStore';

const actorStore = useActorStore()
const toast = useToast()


const isShowSchedule = ref(false)
eventBus.on('show_add_actor',(value) => {
    isShowAddActor.value = value
})

const movies  = ref([
    {
        id: 1,
        name: "Cuộc đời của anh ấy"
    },
    {
        id: 2,
        name: "Cuộc đời của anh ấy"
    },
    {
        id: 3,
        name: "Cuộc đời của anh ấy"
    },
    {
        id: 4,
        name: "Cuộc đời của anh ấy"
    },
    {
        id: 5,
        name: "Ma ám"
    },
    {
        id: 6,
        name: "Kinh hoàng"
    },
    {
        id: 7,
        name: "Nỗi sợ kinh hoàng"
    }
])
const movieSelected = ref(movies[0].movieName)
const linkImage = ref('')
const showGender = ['Nam', 'Nữ']

const onSubmit = async (event) => {
    console.log(event.data)
    const data = {
        name: event.data.name,
        slug: event.data.slug,
        image: event.data.image.name,
        description: event.data.description,
        birthDay: event.data.birthDay,
        gender: event.data.gender,
        height: event.data.height,
        nationality:event.data.nationality
    }
    await actorStore.createActor(data)
    toast.add({ title: 'Thêm diễn viên thành công' })
}

const closeAddActor = () => {
    alert('Những thay đổi sẽ không được lưu')
    isShowAddActor.value = false
}
</script>

<style>

</style>
<template>
  <div class="w-full" style="width: 700px !important;">
    <UModal v-model="isShowAddActor" class="w-full" prevent-close >
        <div class="py-1 px-4" >
            <div class="py-2 flex justify-end">
                <UButton color="gray" variant="ghost" 
                icon="i-heroicons-x-mark-20-solid" class="-my-1" @click="closeAddActor" />
            </div>
            <div class="py-3 px-3">
                <h1 class="text-2xl font-sans text-center font-semibold">Thêm diễn viên</h1>
                <UForm  :state="actor" class="space-y-6" @submit="onSubmit">
                    <div class="grid grid-cols-4 gap-2 mt-5">
                        <p class="col-span-1">Hình ảnh</p>
                        <v-file-input class="col-span-3" density = "compact" v-model="actor.image" label="File input" variant="outlined"></v-file-input>
                    </div>
                    <div class="grid grid-cols-4 gap-2 mt-5">
                        <p class="col-span-1">Tên diễn viên</p>
                        <UInput  class="col-span-3" v-model="actor.name"  size="sm" />
                    </div>
                    <div class="grid grid-cols-4 gap-2 mt-5">
                        <p class="col-span-1">Chiều cao</p>
                        <UInput  class="col-span-3" v-model="actor.height"  size="sm" />
                    </div>
                    <div class="grid grid-cols-4 gap-2 mt-5">
                        <p class="col-span-1">Giới tính</p>
                        <UInputMenu  v-model="actor.gender" :options="showGender" />
                    </div>
                    <div class="grid grid-cols-4 gap-2 mt-5">
                        <p class="col-span-1">Ngày sinh</p>
                        <UInput  class="col-span-3" v-model="actor.birthDay"  size="sm" />
                    </div>
                    <div class="grid grid-cols-4 gap-2 mt-5">
                        <p class="col-span-1">Mô tả</p>
                        <UInput  class="col-span-3" v-model="actor.description"ize="sm" />
                    </div>
                    <div class="grid grid-cols-4 gap-2 mt-5">
                        <p class="col-span-1">Quốc gia</p>
                        <UInput  class="col-span-3" v-model="actor.nationality" size="sm" />
                    </div>
                    <div class="grid grid-cols-4 gap-2 mt-5">
                        <p class="col-span-1">Đường dẫn</p>
                        <UInput  class="col-span-3" v-model ="actor.slug" size="sm" />
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

const actor = reactive({
  name: '',
  slug: '',
  image: '',
  description: '',
  birthDay: '',
  gender: '',
  height: '',
  nationality:''
})

const isShowAddActor = ref(false)
eventBus.on('show_add_actor',(value) => {
    isShowAddActor.value = value
})

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
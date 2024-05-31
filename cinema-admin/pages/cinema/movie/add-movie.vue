<script setup>
import eventBus from '~/utils/eventBus'
import AddActor from '~/components/actor/AddActor.vue'
import { useMovieStore } from '~/stores/admin/useMovieStore';
import { useActorStore } from '~/stores/admin/useActorStore'

const isDeleteAccountModalOpen = ref(false)
const movieStore = useMovieStore()
const actorStore = useActorStore()


actorStore.getAllActor()
const movie = reactive({
  movieDuration: '',
  endTime: '',
  premiereDate: '',
  description: '',
  director: '',
  image: '',
  heroImage: '',
  imageSuggest:'',
  language:'' ,
  name:'',
  trailer:'',
  slug:'',
  type:[],
  actor:[],
  codeCinema:'Space Mỹ Đình',
  isUpcoming:'Phim sắp chiếu'
})

const showTime = ['Phim sắp chiếu','Phim đang chiếu', 'Ngừng chiếu']

const showTimeSelected = ref(showTime[0])

const toast = useToast()

const people = computed(() => {
  return actorStore.actorName
})


const movieType = ref([
  { name: 'Lãng mạn'},
  { name: 'Kinh dị'},
  { name: 'Tình cảm' },
  { name: 'Hài hước' },
  { name: 'Dật gân'},
  { name: 'Hành động'}
])

const cinema = ['Space Mỹ Đình', 'Space Thanh Xuân',
'Space Đan Phượng','Space Giải Phóng','Space Quang Trung',
'Space Văn Khiêm','Space Bắc Giang','Space Biên Hòa','Space Long Khánh',
'Space Nha Trang','Space Thái Nguyên','Space Thanh Hóa','Space Phú Mỹ',
'Space Hồ Tràm','Space Tân Uyên','Space Lào cai','Space Phú quốc',
'Space Quang Khải']
const openAddActor = () => {
  eventBus.emit('show_add_actor',true)
}

function handleFileUpload(event, key) {
  // Kiểm tra xem event và files có tồn tại không
  if (event && event.target && event.target.files && event.target.files.length > 0) {
    const file = event.target.files[0];
    if (file) {
      movie[key] = "/img/" + file.name;

    }
  } else {
    console.error('No files selected or event object is missing');
  }
}


const onSubmit = async (event) => {
    // console.log(event.data)
    // const data = {
    //   movieDuration: event.data.movieDuration,
    //   endTime: event.data.endTime,
    //   premiereDate: event.data.premiereDate,
    //   description: event.data.description,
    //   director: event.data.director,
    //   image: movie.image,
    //   heroImage: movie.heroImage,
    //   imageSuggest: movie.imageSuggest,
    //   language:event.data.language ,
    //   name:event.data.name,
    //   trailer:event.data.trailer.name,
    //   slug:event.data.slug,
    //   type:event.data.type,
    //   actor:event.data.actor,
    //   codeCinema:event.data.codeCinema,
    //   isUpcoming:event.data.isUpcoming
    // }

    try {
      await movieStore.createMovie(movie)
      toast.add({ title: 'Thêm phim thành công' })
    } catch (error) {
    }

}
const check = () => {
  // console.log(movie.image + ' ///' + movie.heroImage + ' ///' + movie.imageSuggest)
  console.log(movie.image)
}
</script>

<template>
  <div>
    <AddActor/>
  </div>
  <UDashboardPanelContent class="pb-24">
    <h1 class="text-center font-medium font-sans text-3xl">Thêm mới phim</h1>
    <button @click = "check">Check</button>
    <UForm
      :state="movie"
      @submit="onSubmit"
    >
      <UDashboardSection>
        
        
        <div class="grid grid-cols-4 gap-2 mt-2">
          <p class="col-span-1">Tên phim</p>
          <UInput
            placeholder="Tên phim"
            class ="col-span-2 w-full"
            v-model="movie.name"
            autocomplete="off"
            size="md"
          />
        </div>

        <div
          class="grid grid-cols-4 gap-2 mt-3 items-center"
        >
          <p class = "col-span-1">Thời lượng (Phút)</p>
          <UInput
          placeholder="Thời lượng"
            class ="col-span-2"
            v-model="movie.movieDuration"
            autocomplete="off"
            size="md"
          />
      </div>

        <div class="grid grid-cols-4 gap-2 mt-3 items-center">
          <p class="col-span-1">Đường dẫn</p>
          <UInput
          placeholder="Đường dẫn"
            class ="col-span-2"
            v-model="movie.slug"
            autocomplete="off"
            size="md"

          >
          </UInput>
        </div>
        <div
          class="grid grid-cols-4 gap-2 items-center mt-3"
          >
          <p class="col-span-1 items-center">Ngày công chiếu"</p>
          <div class="col-span-2">
            <UInput
            id="password"
            type="datetime-local"
            v-model="movie.premiereDate"
            placeholder="Ngày công chiếu"
            size="md"
            />
            </div>
          </div>
            <div class="grid grid-cols-4 gap-2 items-center">
              <p class = "col-span-1"> ngày kết thúc</p>
                <UInput
                id="password_new"
                v-model="movie.endTime"
                type="datetime-local"
                placeholder="Ngày kết thúc"
                size="md"
                class="mt-2 col-span-2"
                />
            </div>


        <div
          class="grid grid-cols-4 gap-2 items-center"
        >
          <p class="col-span-1">Đạo diễn</p>
          <UInput
            placeholder="Đạo diễn"
            class ="col-span-2"
            v-model="movie.director"
            autocomplete="off"
            size="md"
          />
        </div>
        <div class="grid grid-cols-4 gap-5 items-center">
        <p class = "col-span-1">Diễn viên</p>
        <div class="col-span-2">
                <v-autocomplete
                  density = "compact"
                  :items="people"
                  v-model ="movie.actor"
                  label ="Diễn viên"
                  chips
                  variant="outlined"
                  clearable
                  closable-chips
                  multiple
                >
                  <template v-slot:chip="{ props, item }">
                    <v-chip
                      v-bind="props"
                      :text="item.raw.name"
                    ></v-chip>
                  </template>

                  <template v-slot:item="{ props, item }">
                    <v-list-item
                      v-bind="props"
                      :title="item.raw.name"
                    ></v-list-item>
                  </template>
                </v-autocomplete>
        </div>
        <div class="col-span-1">
          <UButton
          @click = "openAddActor"
          class ="col-span-2"
          icon="i-heroicons-pencil-square"
          size="sm"
          color="primary"
          variant="solid"
          label="Thêm diễn viên"
          :trailing="false"
          />
        </div>  

        </div>

        <div class = "grid grid-cols-4 gap-2 items-center mt-3">
          <p class="col-span-1">Thể loại</p>
          <div class="col-span-2">
            <v-autocomplete
                  density = "compact"
                  :items="movieType"
                  v-model="movie.type"
                  label ="Thể loại"
                  chips
                  variant="outlined"
                  clearable
                  closable-chips
                  multiple
                >
                  <template v-slot:chip="{ props, item }">
                    <v-chip
                      v-bind="props"
                      :text="item.raw.name"
                    ></v-chip>
                  </template>

                  <template v-slot:item="{ props, item }">
                    <v-list-item
                      v-bind="props"
                      :title="item.raw.name"
                    ></v-list-item>
                  </template>
                </v-autocomplete>
          </div>
        </div>

        <div class="grid grid-cols-4 gap-2 mt-3 items-center">
          <p class="col-span-1">Hình ảnh</p>
          <input class="col-span-2" @change="handleFileUpload($event,'image')" placeholder="Hình ảnh" type="file">
        </div>
        <div class="grid grid-cols-4 gap-2">
          <p class="col-span-1">Hình ảnh giới thiệu</p>
          <input class="col-span-2" @change="handleFileUpload($event,'heroImage')" placeholder="Hình ảnh giới thiệu" type="file">
        </div>
        <div class="grid grid-cols-4 gap-2">
          <p class="col-span-1">Hình ảnh gợi ý</p>
          <input class="col-span-2" @change="handleFileUpload($event,'imageSuggest')" placeholder="Hình ảnh gợi ý" type="file">
        </div>
        <div
          class="grid grid-cols-4 gap-2 mt-3 items-center"
        >
        <p class="col-span-1">Giới thiệu phim</p>
        <UInput v-model="movie.trailer" class="col-span-2" placeholder="Trailler"></UInput>
        </div>
        <div
          class="grid grid-cols-4 gap-2"
        >
        <p class="col-span-1">Quốc gia</p>
          <UInput
            class ="col-span-2"
            placeholder="Quốc gia"
            v-model="movie.language"
            autocomplete="off"
            size="md"
          />
      </div>

        <div
          class="grid grid-cols-4 gap-2 mt-3 items-center"
        >
          <p class="col-span-1">Mô tả</p>
          <UTextarea
            class = "col-span-2"
            v-model="movie.description"
            :rows="5"
            placeholder="Mô tả"
            autoresize
            size="md"
          />
        </div>

        <div
          class="grid grid-cols-4 gap-2 mt-3 items-center"
        >
        <p class="col-span-1">Thời gian chiếu</p>
         <UInputMenu class="col-span-2" v-model="movie.isUpcoming" :options="showTime" />
        </div>
        <div class="grid grid-cols-4 gap-2">
          <p class="col-span-1">Cụm rạp</p>
          <USelectMenu v-model="movie.codeCinema" :options="cinema" />
        </div>
      </UDashboardSection>
      <UButton
          type = "submit"
          color="green"
          label="Thêm mới"
          size="md"
          @click="createMovie"
      />
      <!-- <UButton
          type = "submit"
          color="green"
          label="check"
          size="md"
          @click="check"
      /> -->
    </UForm>
    <!-- ~/components/settings/DeleteAccountModal.vue -->
  <SettingsDeleteAccountModal v-model="isDeleteAccountModalOpen" />
</UDashboardPanelContent>
</template>

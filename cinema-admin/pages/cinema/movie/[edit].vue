<script setup lang="ts">
import eventBus from '~/utils/eventBus'
import AddActor from '~/components/actor/AddActor.vue'
import { useMovieStore } from '~/stores/admin/useMovieStore';
import { useActorStore } from '~/stores/admin/useActorStore';

const isDeleteAccountModalOpen = ref(false)

const movieStore = useMovieStore()
const actorStore = useActorStore()
const route = useRoute()


movieStore.getMovie(route.params.edit);
movieStore.getMovieType();
movieStore.getAllCinemaName();
actorStore.getAllActor();

const movie = computed(()=> {
  return movieStore.movie;
})



const showTime = ['Phim sắp chiếu','Phim đang chiếu']

const showTimeSelected = ref(showTime[0])

const toast = useToast()


const actorName = computed(() =>{
  return actorStore.actorName;
})
const cinema = computed(() =>{
    return movieStore.cinemaName;
})
const movieType = computed(() =>{
  return movieStore.movieType;
} );



const openAddActor = () => {
  eventBus.emit('show_add_actor',true)
}
const onSubmit = async(event) => {
  const data = {
      movieDuration: event.data.movieDuration,
      endTime: event.data.endTime,
      premiereDate: event.data.premiereDate,
      description: event.data.description,
      director: event.data.director,
      image: event.data.image.name,
      herolmage: event.data.herolmage.name,
      language:event.data.language ,
      name:event.data.name,
      trailer:event.data.trailer.name,
      slug:event.data.slug,
      type:event.data.type,
      actor:event.data.actor,
      codeCinema:event.data.codeCinema,
      isUpcoming:event.data.isUpcoming
    }
   eventBus.emit('update_movie',data)
   isDeleteAccountModalOpen.value = true
}

const check = () => {
  console.log(typeof movie.value.actor)
}
</script>

<template>
    <div>
    <AddActor/>
  </div>
  <UDashboardPanelContent class="pb-24">
    <UForm :state="movie" @submit="onSubmit">
    <UDashboardSection>
        
        <div class="grid grid-cols-4 gap-2">
          <p class="col-span-1">Tên phim</p>
          <UInput
            class ="col-span-2 w-full"
            v-model="movie.name"
            autocomplete="off"
            size="md"
          />
        </div>

        <div
          class="grid grid-cols-4 gap-2"
        >
          <p class = "col-span-1">Thời lượng</p>
          <UInput
            class ="col-span-2"
            v-model="movie.movieDuration"
            autocomplete="off"
            size="md"
          />
      </div>

        <div
          class="grid grid-cols-4 gap-2"
        >
          <p class="col-span-1">Đường dẫn</p>
          <UInput
            class ="col-span-2"
            v-model="movie.slug"
            autocomplete="off"
            size="md"

          >
          </UInput>
        </div>
        <div
          class="grid grid-cols-4 gap-2"
        >
          <p class="col-span-1">Ngày công chiếu, ngày kết thúc"</p>
          <div class="col-span-2">
            <UInput
            id="password"
            v-model="movie.premiereDate"
            placeholder="Ngày công chiếu"
            size="md"
            />
            <UInput
            id="password_new"
            v-model="movie.endTime"

            placeholder="Ngày kết thúc"
            size="md"
            class="mt-2"
            />
          </div>

          </div>
        <div
          class="grid grid-cols-4 gap-2"
        >
          <p class="col-span-1">Đạo diễn</p>
          <UInput
            class ="col-span-2"
            v-model="movie.director"
            autocomplete="off"
            size="md"
          />
        </div>
        <div class="grid grid-cols-4 gap-5">
        <p class = "col-span-1">Diễn viên</p>
        <div class="col-span-2">
                <v-autocomplete
                  density = "compact"
                  :items="actorName"
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

        <div class = "grid grid-cols-4 gap-2">
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

        <div
          class="grid grid-cols-4 gap-2"
        >
          <p class="col-span-1">Hình ảnh</p>
          <v-file-input class="col-span-2" density = "compact" v-model="movie.image" label="File input" variant="outlined"></v-file-input>
        </div>
        <div
          class="grid grid-cols-4 gap-2"
        >
          <p class="col-span-1">Hình ảnh giới thiệu</p>
          <v-file-input density ="compact" v-model="movie.herolmage" class="col-span-2" label="File input" variant="outlined"></v-file-input>
        </div>
        <div
          class="grid grid-cols-4 gap-2"
        >
        <p class="col-span-1">Giới thiệu phim</p>
        <v-file-input density ="compact" v-model="movie.trailer" class="col-span-2" label="File input" variant="outlined"></v-file-input>
        </div>
        <div
          class="grid grid-cols-4 gap-2"
        >
        <p class="col-span-1">Quốc gia</p>
          <UInput
            class ="col-span-2"
            v-model="movie.language"
            autocomplete="off"
            size="md"
          />
      </div>

        <div
          class="grid grid-cols-4 gap-2"
        >
          <p class="col-span-1">Mô tả</p>
          <UTextarea
            class = "col-span-2"
            v-model="movie.description"
            :rows="5"
            autoresize
            size="md"
          />
        </div>

        <div
          class="grid grid-cols-4 gap-2"
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
          type="submit"
          color="green"
          label="Lưu thay đổi"
          size="md"
        />
    </UForm>


    <UDashboardSection
      description=""
    >
      <div>
        <UButton
          color="green"
          label="check"
          size="md"
          @click="check"
        />
      </div>
    </UDashboardSection>

    <!-- ~/components/settings/DeleteAccountModal.vue -->
    <SettingsDeleteAccountModal v-model="isDeleteAccountModalOpen" />
  </UDashboardPanelContent>
</template>

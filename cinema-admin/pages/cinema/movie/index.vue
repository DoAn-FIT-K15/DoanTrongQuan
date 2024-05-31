<template>
  <div class="text-right py-6 px-5" >
    <NuxtLink to="/cinema/movie/add-movie"><UButton color="green" variant="solid">Thêm mới</UButton></NuxtLink>
  </div>
  <div class="text-right pb-6 px-5 grid grid-cols-2 gap-2.5" >
    <UInput
    v-model ="searchMovieName"
    icon="i-heroicons-magnifying-glass-20-solid"
    size="lg"
    color="green"
    :trailing="false"
    placeholder="Tìm kiếm theo tên phim"
    />
    <UInput
    icon="i-heroicons-magnifying-glass-20-solid"
    size="lg"
    color="green"
    :trailing="false"
    placeholder="Tìm kiếm theo diễn viên hoặc đạo diễn"
    />
  </div>
  <div class="bg-white overflow-y-auto">
    <div class="mx-auto max-w-2xl px-4 py-10 sm:px-6 sm:py-24 lg:max-w-7xl lg:px-8">
      <h2 class="sr-only">Products</h2>

      <div class="grid grid-cols-1 gap-x-6 gap-y-10 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 xl:gap-x-8">
        <a v-if = "searchMovieName" v-for="movie in moviesFilter" :key="movie.id" :href="movie.href" class="group ">
          <div class="sm:aspect-h-3 sm:aspect-w-2  lg:aspect-h-4 lg:aspect-w-3 w-full  rounded-lg bg-gray-200 xl:aspect-h-11 xl:aspect-w-7">
            <img :src="movie.image" :alt="movie.image" class="h-full w-full  group-hover:opacity-75" />
          </div>
          <p class="mt-1 text-lg font-medium text-gray-900">{{ movie.name }}</p>
          <NuxtLink :to="`/cinema/movie/${movie.slug}`"><UButton @click="editMovie(movie)" color="violet" variant="solid">Chỉnh sửa</UButton></NuxtLink>
          <UButton @click = "stopShowing(movie.slug)">Dừng chiếu</UButton>
        </a>
        <a v-else v-for="movie in movies" :key="movie.id" :href="movie.href" class="group ">
          <div class="sm:aspect-h-3 sm:aspect-w-2  lg:aspect-h-4 lg:aspect-w-3 w-full  rounded-lg bg-gray-200 xl:aspect-h-11 xl:aspect-w-7">
            <img :src="movie.image" :alt="movie.image" class="h-full w-full  group-hover:opacity-75" />
          </div>
          <p class="mt-1 text-lg font-medium text-gray-900">{{ movie.name }}</p>
          <NuxtLink :to="`/cinema/movie/${movie.slug}`"><UButton @click="editMovie(movie)" color="violet" variant="solid">Chỉnh sửa</UButton></NuxtLink>
          <UButton @click = "stopShowing(movie.slug)">Dừng chiếu</UButton>
        </a>
        
      </div>
    </div>
  </div>
</template>

<script setup>
import { useMovieStore } from '~/stores/admin/useMovieStore';


const movieStore = useMovieStore()
  

movieStore.getAllMovie()

const movies = computed(() => {
  return movieStore.movies;
}) 

const searchMovieName = ref('')
const moviesFilter = ref([])

watch(() => searchMovieName.value, (newValue, oldValue) => {
    // Chuyển đổi giá trị mới và tên phim thành chữ thường trước khi so sánh
    const searchValueLower = newValue.toLowerCase();
    moviesFilter.value = movies.value.filter(movie => {
      const movieNameLower = movie.name.toLowerCase();
      return movieNameLower.includes(searchValueLower);
    });
  
});

const stopShowing = (slug) => {
  movieStore.stopShowMovie(slug)
}

const editMovie = (movie) => {

}

</script>
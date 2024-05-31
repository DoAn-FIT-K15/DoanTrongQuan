<template>
              <div class="lg:max-w-[80%] mx-auto">
                <v-card style="padding-top: 15px" flat>
                    <v-tabs class="col-md-12 col-8" style="align-items: center !important; height: 80px;width: 100% !important; " v-model="tab" color="deep-purple-accent-4" align-tabs="center">
                        <v-tab :value="1"><h1 class="title" style="margin-bottom: 0 !important; height: 40px; font-family: Arial, Helvetica, sans-serif; font-weight: bold">PHIM SẮP CHIẾU</h1> </v-tab>
                        <v-tab :value="2"><h1 class="title" style="margin-bottom: 0 !important; height: 40px; font-family: Arial, Helvetica, sans-serif; font-weight: bold">PHIM ĐANG CHIẾU</h1> </v-tab>
                    </v-tabs>
                    <v-window v-model="tab">
                        <v-window-item :value = "2">
                            <v-container style="padding-top: 25px" fluid>
                                <div class="row">
                                    <div class="col-lg-3 col-sm-12 col-md-6 movie" v-for="(movie, i) in movieShowings" :key="i" style="padding-bottom: 30px">
                                        <div class="card">
                                            <div class="row">
                                                <div class="col-6 col-lg-12" style="padding-top: 0; padding-bottom: 0; position: relative">
                                                    <div @mousemove="showIconPlayAndOverlay(i, true)" @mouseleave="showIconPlayAndOverlay(i, false)" class="image-container" style="position: relative">
                                                        <img class="card-img-top" :src="movie.movieImage" alt="..." />
                                                        <div v-show="isShowOverlay[i]" class="overlay"></div>
                                                        <div v-show="isShowIconPlay[i]" class="icon-play w-full h-full" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%)">
                                                            <font-awesome-icon @click="openDialogTrailer(movie.movieTrailer)" style="width: 50px; height: 60px; color: white" :icon="['fas', 'circle-play']" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-6" style="padding-top: 5px; padding-bottom: 0">
                                                    <h5 class="card-title h-12" style="color: #337ab7; font-weight: 700">{{ movie.movieName }}</h5>
                                                    <p  class="card-text" style="font-weight: 700">Thể loại:
                                                        <span v-for = "(movieType, j) in movie.movieTypeName" :key="j">{{ movieType }} {{    }} </span></p>
                                                    <p class="card-text"><span style="font-weight: 700">Thời lượng: </span>{{ movie.movieDuration }} phút</p>
                                                        <NuxtLink :to="`/movie/${movie.slug}`"><button class="btn" style="width: 100%">MUA VÉ</button></NuxtLink>
                                                </div>
                                            </div>
                                        </div>
                                    </div>  
                                </div>
                            </v-container>
                        </v-window-item>
                        <v-window-item :value = "1">
                            <v-container style="padding-top: 25px" fluid>
                                <div class="row">
                                    <div class="col-lg-3 col-sm-12 col-md-6 movie" v-for="(movie, i) in movieUpcoming" :key="i" style="padding-bottom: 30px">
                                        <div class="card">
                                            <div class="row">
                                                <div class="col-6 col-lg-12" style="padding-top: 0; padding-bottom: 0; position: relative">
                                                    <div @mousemove="showIconPlayAndOverlay(i, true)" @mouseleave="showIconPlayAndOverlay(i, false)" class="image-container" style="position: relative">
                                                        <img class="card-img-top" :src="movie.movieImage" alt="..." />
                                                        <div v-show="isShowOverlay[i]" class="overlay"></div>
                                                        <div v-show="isShowIconPlay[i]" class="icon-play w-full h-full" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%)">
                                                            <font-awesome-icon @click="openDialogTrailer(movie.movieTrailer)" style="width: 50px; height: 60px; color: white" :icon="['fas', 'circle-play']" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-6" style="padding-top: 5px; padding-bottom: 0">
                                                    <h5 class="card-title h-12" style="color: #337ab7; font-weight: 700">{{ movie.movieName }}</h5>
                                                    <p  class="card-text" style="font-weight: 700">Thể loại:
                                                        <span v-for = "(movieType, j) in movie.movieTypeName" :key="j">{{ movieType }} {{    }} </span></p>
                                                    <p class="card-text"><span style="font-weight: 700">Thời lượng: </span>{{ movie.movieDuration }} phút</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>  
                                </div>
                            </v-container>
                        </v-window-item>
                    </v-window>
                </v-card>
            </div>
</template>

<script setup>
import { useMovie } from '~/composables/Movie/useMovie'
import {useMovieStore} from '~/stores/user/useMovieStore'

// definePageMeta({
//     layout:true
// })

onMounted(() => {
    // lấy dữ liệu lên
movieStore.getAllMovieByCinema()
})

const movieStore = useMovieStore()




const movieUpcoming = computed(() => {
    return movieStore.movieUpcoming
})
const movieShowings = computed(() => {
    return movieStore.movieShowings
})

const router = useRouter()
const {
    isShowIconPlay,
    isShowOverlay,
    showIconPlayAndOverlay,
    isShowTrailer,
    currentMovieTrailer,
    openDialogTrailer
} = useMovie()


// const { showMovieDetail } = useHomePage()
const movies = computed(()=> {
    return movieStore.movies;
})

</script>
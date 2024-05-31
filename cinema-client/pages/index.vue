<script setup>
import { useMovie } from '~/composables/Movie/useMovie'
import {useMovieStore} from '~/stores/user/useMovieStore'

// definePageMeta({
//     layout:true
// })

const movieStore = useMovieStore()



movieStore.getAllMovieByCinema()




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
const showMovieDetail = (data) => {
        console.log(data)
        
    }


const active = ref(false);

const tab = ref(null);
const banner = ref([{ linkImage: '/img/image-caroseol.jpg' }, { linkImage: '/img/movie_galaxy.jpg' },{ linkImage: '/img/image-caroseol2.jpg' }]);

</script>

<template>
<Global>
    <div>
                <UModal v-model="isShowTrailer" width="800px" height ="500px" not-center :ui = "{width: 'lg:max-w-2xl'}">
                    <div class="con-content" >
                        <iframe
                            class = "w-full h-[500px]"
                            :src="currentMovieTrailer"
                            title=""
                            frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                            allowfullscreen
                        ></iframe>
                    </div>

                    <template #footer>
                        <div class="con-footer">
                            <button type="transparent" @click="active = false"> Ok </button>
                        </div>
                    </template>
                </UModal>
            </div>
        <div  class="main" >
            <div class="wrap-header">
                <v-carousel cycle style="height: auto" hide-delimiter-background show-arrows="hover" :interval="6000000">
                    <v-carousel-item v-for="(ban, i) in banner" :key="i">
                        <v-sheet height="100%">
                            <div class="d-flex fill-height justify-center align-center">
                                <img :src="ban.linkImage" alt="" class = "w-full"/>
                            </div>
                        </v-sheet>
                    </v-carousel-item>
                </v-carousel>
            </div>
            <div class="category col-xl-9 col-xxl-8 col-sm-11">
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
            <!-- <div>
                <Intro/>
            </div> -->
        </div>
    </Global>
</template>

<style  scoped>


.main {
    width: 100%;
    height: auto;
}
.wrap-header {
    display: flex;
    justify-content: space-between;
    width: 100%;

    /* background: rgba(152, 145, 145, 0.43) ; */
    z-index: 0;
}

.category {
    margin-left: auto;
    margin-right: auto;
    padding-top: 30px;
}
.tittle-popular-courses {
    width: 20%;
    margin-bottom: 20px;
    border-left: 5px solid #28b1ff;
}
.image-course {
    object-fit: cover;
}
/* .v-carousel{
  z-index: 0 !important;
} */
.v-carousel-item {
    transition: transform 0.9s ease;
}
.movie .card:hover {
    /* box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); */
    transform: translateY(-0.7px) scale(1.01);
}

.movie .card {
    padding: 0;
    transition: transform 0.1s ease, box-shadow 0.3s ease;
    border: none;
}
.loading-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgb(199, 17, 17);
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 16px;
}

.image-container {
    max-width: 250px !important;
    max-height: 382px !important;
    position: relative;
    border-radius: 20px;
}
.card-img-top {
    width: 100%;
    height: 100% !important;
    z-index: 0;
    border-radius: 20px;
}


@media only screen and (max-width: 768px) {
    .title {
        font-size: 16px !important; /* Kích thước chữ cho màn hình nhỏ */
    }
}
@media only screen and (min-width: 768px) and (max-width: 992px) {
    .image-container {
        width: 137.5px;
        height: 217.59px;
    }
    .icon-play {
        width: 137.5px;
        height: 217.59px;
    }
}
/* @media only screen and (min-width: 992px) {
    .image-container {
        width: 100%;
        height: 370px;
    }
    .icon-play {
        width: 100%;
        height: 370px;
    }
} */
.btn {
    background-size: 200% auto;
    border-radius: 5px;
    background: #0a64a7;
    color: #fff;
    font-size: large;
    font-weight: normal;
}
.btn:hover {
    background-image: linear-gradient(to right, #0a64a7 0%, #258dcf 51%, #3db1f3 100%) !important;
    color: #fff;
}

.icon-play {
    position: absolute;
    top: 0;
    left: 0;
    z-index: 1;
    display: flex;
    justify-content: center;
    align-items: center;
}


.overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.3);
    border-radius: 20px;
}

.not-margin {
    margin: 0px;
    font-weight: normal;
    padding: 10px;
}

.con-form {
    width: 100%;
}

.con-form .flex {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.con-form .flex a {
    font-size: 0.8rem;
    opacity: 0.7;
}

.con-form .flex a:hover {
    opacity: 1;
}

.con-form .vs-checkbox__label {
    font-size: 0.8rem;
}

.con-form .vs-input {
    margin: 10px 0px;
    width: calc(100%);
}

.con-form .vs-input .vs-input__original {
    width: 100%;
}

.con-footer {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    width: calc(100%);
}

.con-footer .new {
    margin: 0px;
    margin-top: 20px;
    padding: 0px;
    font-size: 0.7rem;
}

.con-footer .new a {
    color: rgba(var(--vs-primary));
    margin-left: 6px;
}

.con-footer .new a:hover {
    text-decoration: underline;
}

.con-footer .vs-button {
    margin: 0px;
}
</style>
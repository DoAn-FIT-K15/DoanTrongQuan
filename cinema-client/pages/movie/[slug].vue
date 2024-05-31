<template>
  <Global>
    <UModal v-model="isOpenTrailler"   class="z-[54]"
      :ui = "{ width: 'lg:max-w-2xl'}"
      >
        <div >
          <iframe class = "w-full h-[500px]" :src="movieDetail.trailer" 
          title="YouTube video player" frameborder="0" 
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
          referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>

    </UModal>
  <div>
    <div>
            <UModal
            v-model="isShowConfirmSelectSchedule"
            width="700px">
            <div class="p-3">
                  <div>
                    <h4 style="margin-top: 20px; text-align: center;">BẠN ĐANG <b>ĐẶT VÉ</b> XEM PHIM</h4>
                  </div>
                      
                <div class="con-content" style="width: 100%;height: 180px">
                    <h1 class="text-center" 
                    style="border-bottom: 1px solid #f4f4f4;
                    color: #03599d;font-size: 33px;font-family: sans-serif;
                    font-weight: 600 !important;">{{ movieName }}</h1>
                    <v-table style="height: 100%;">
                        <thead style="height: 50%;">
                        <tr>
                            <th class="text-center"><h4>Rạp chiếu</h4></th>                                                   
                            <th class="text-center"><h4>Ngày chiếu</h4></th>                                                
                            <th class="text-center"><h4>Giờ chiếu</h4></th>                                                      
                        </tr>
                        </thead>
                        <tbody style="height: 100%;background-color: #eaeaea;margin-top: 15px;">
                        <tr>
                            <td class="text-center"><h3 style="font-weight: 700;font-size: 23px;">{{ nameOfCinema }}</h3></td>
                            <td class="text-center"><h3 style="font-weight: 700;font-size: 23px;">{{ selectedDay }}</h3></td>
                            <td class="text-center"><h3 style="font-weight: 700;font-size: 23px;">{{ selectedTime }}</h3></td>
                        </tr>
                        </tbody>
                    </v-table>
                </div>
                <div class="flex justify-center">
                  <button @click ="booking" class="hover:bg-[#FF7614] hover:text-white p-2 rounded-lg">ĐỒNG Ý</button>
                </div>
            </div>

                
            </UModal>
        </div>
    <div class="relative bg-black flex justify-center w-full h-full">
      <div class="absolute w-full h-full z-[49] bg-[#0003]"></div>
      <div class="relative h-full">
        <div class="relative">
          <img
            loading="lazy"
            class="w-[860px] h-full md:h-full lg:h-[500px] object-fill object-cover duration-500 ease-in-out group-hover:opacity-100&quot; scale-100 blur-0 grayscale-0)"
            style="color: transparent"
            :src="movieDetail.heroImage"
            alt=""
          />
          <button @click = "showTrailler" class="absolute top-[50%] left-[50%] -translate-x-2/4 -translate-y-2/4 z-[53]">
            <img
              width="64"
              height="64"
              class="w-[40px] h-[40px] lg:w-[64px] lg:h-[64px] object-cover duration-500 ease-in-out group-hover:opacity-100&quot; scale-100 blur-0 grayscale-0)"
              src="https://www.galaxycine.vn/_next/static/media/button-play.2f9c0030.png"
              alt=""
            />
          </button>
          
        </div>

        <div class="absolute top-0 -left-[0%] z-100 lg:block hidden">
          <img
            class="w-full lg:h-[500px] object-cover"
            decoding="async"
            loading="lazy"
            style="color: transparent"  
            src="https://www.galaxycine.vn/_next/static/media/blur-left.7a4f1851.png"
            alt=""
          />
        </div>
        <div class="absolute top-0 -right-[0%] z-100 lg:block hidden">
          <img
            class="w-full lg:h-[500px] object-cover"
            width="342"
            height="680"
            loading="lazy"
            style="color: transparent"
            src="https://www.galaxycine.vn/_next/static/media/blur-right.52fdcf99.png"
            alt=""
          />
        </div>
      </div>
    </div>
    <div
      class="grid grid-cols-1 xl:grid-cols-9 my-0 mx-auto  xl:max-w-7xl lg:max-w-5xl md:max-w-4xl gap-8 py-7 md:px-4 px-4"
    >
      <div class="book__left lg:col-span-6 w-full">
        <div class="book__film flex flex-col">
          <div class="movie__info   md:grid hidden grid-cols-3 md:gap-5 gap-4">
            <div
              class="movie__thumbnail lg:-translate-y-20 md:-translate-y-16 -translate-y-0 col-span-1 drop-shadow-2xl z-[39]"
            >
              <img
                alt="movieDetail.name"
                :src="movieDetail.image"
              />
            </div>
            <div class="col-span-2  flex flex-col ">
              <div class="item__title flex items-center">
                <h1 class="text-[20px] md:text-[24px] lg:text-[28px] font-bold text-black-10 mr-4">
                 {{  movieDetail.name }}
                </h1>
                <span
                  class="inline-flex items-center justify-center w-[38px] h-7 bg-primary rounded text-sm text-center text-white font-bold not-italic"
                  >T13</span
                >
              </div>
              <div class="flex items-center">
                <div class="text-sm flex items-center font-semibold not-italic">
                  <svg width="14" height="14" viewBox="0 0 14 14" fill="none" class="inline-block align-baseline mr-1">
                    <path
                      d="M7 0C3.13306 0 0 3.13306 0 7C0 10.8669 3.13306 14 7 14C10.8669 14 14 10.8669 14 7C14 3.13306 10.8669 0 7 0ZM7 12.6452C3.88105 12.6452 1.35484 10.119 1.35484 7C1.35484 3.88105 3.88105 1.35484 7 1.35484C10.119 1.35484 12.6452 3.88105 12.6452 7C12.6452 10.119 10.119 12.6452 7 12.6452ZM8.74435 9.69839L6.34798 7.95685C6.26048 7.89193 6.20968 7.79032 6.20968 7.68306V3.04839C6.20968 2.8621 6.3621 2.70968 6.54839 2.70968H7.45161C7.6379 2.70968 7.79032 2.8621 7.79032 3.04839V7.04798L9.67581 8.41976C9.82823 8.52984 9.85927 8.74153 9.74919 8.89395L9.21855 9.625C9.10847 9.7746 8.89677 9.80847 8.74435 9.69839Z"
                      fill="#F58020"
                    ></path>
                  </svg>
                  <span>{{movieDetail.duration}} Phút</span>
                  <!-- <button @click = "check">check</button> -->
                </div>
                <div class="text-sm ml-4 flex items-center font-semibold not-italic">
                  <svg width="12" height="14" viewBox="0 0 12 14" fill="none" class="inline-block align-baseline mr-1">
                    <path
                      d="M10.7143 1.75H9.42857V0.328125C9.42857 0.147656 9.28393 0 9.10714 0H8.03571C7.85893 0 7.71429 0.147656 7.71429 0.328125V1.75H4.28571V0.328125C4.28571 0.147656 4.14107 0 3.96429 0H2.89286C2.71607 0 2.57143 0.147656 2.57143 0.328125V1.75H1.28571C0.575893 1.75 0 2.33789 0 3.0625V12.6875C0 13.4121 0.575893 14 1.28571 14H10.7143C11.4241 14 12 13.4121 12 12.6875V3.0625C12 2.33789 11.4241 1.75 10.7143 1.75ZM10.5536 12.6875H1.44643C1.35804 12.6875 1.28571 12.6137 1.28571 12.5234V4.375H10.7143V12.5234C10.7143 12.6137 10.642 12.6875 10.5536 12.6875Z"
                      fill="#F58020"
                    ></path>
                  </svg>
                  <span>{{ movieDetail.startDate }}</span>
                </div>
              </div>
              <div class="mt-2">
                <a class="text-[20px] hover:text-primary transition duration-500 ease-in-out cursor-pointer">
                  <!-- <svg
                    aria-hidden="true"
                    focusable="false"
                    data-prefix="fas"
                    data-icon="star"
                    class="svg-inline--fa fa-star text-primary mr-1 hover:text-primary transition duration-500 ease-in-out"
                    role="img"
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 576 512"
                  >
                    <path
                      fill="currentColor"
                      d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                    ></path>
                  </svg> -->
                  <!-- <span class="inline-block mr-1">{{ movieDetail.vote }}</span>
                  <span class="inline-block text-sm text-grey-40 hover:text-primary transition duration-500 ease-in-out"
                    >(
              =
                    {{ movieDetail.totalVote }} votes
               
                    )</span -->
                  
                </a>
              </div>
              <div class="flex flex-col gap-2">
                <div class="flex flex-nowrap text-sm">
                   <span class="inline-block h-8 py-[6px] text-grey-40 ">Quốc gia: </span>
                  <span class="inline-block h-8 ml-4 py-[6px] capitalize not-italic"
                    >{{ movieDetail.language}}
                    <!-- -->
                    </span
                  >
                 
                </div>
                <div class="flex flex-nowrap items-center text-sm">
                  <span class="inline-block h-8 py-[6px] text-grey-40 flex-0"
                    >Nhà sản xuất
                    <!-- -->
                    :</span
                  >
                  <ul class="ml-2 flex flex-wrap gap-1 flex-1 mb-0">
                    <li class="text-sm cursor-pointer hover:text-primary transition duration-500 ease-in-out">
                      <span class="mr-[1px]">Columbia Pictures</span>
                    </li>
                  </ul>
                </div>
                <div class="flex flex-nowrap items-center text-sm">
                  <span class="inline-block h-8 py-[6px] text-grey-40 w-[70px] flex-0"
                    >Thể loại
                    <!-- -->
                    :</span
                  >
                  <ul class="ml-2 flex flex-wrap gap-1 flex-1 mb-0">
                    <li v-for ="(type,i) in movieDetail.movieType" :key="i" class="inline-block">
                      <a
                        class="text-black text-sm inline-flex h-8 border border-grey-20 hover:border-primary rounded-lg px-4 py-2 capitalize not-italic items-center"
                        href="/dien-anh/hai/"
                        >{{ type }}</a
                      >
                    </li>
                  </ul>
                </div>
                <div class="flex flex-nowrap items-center text-sm">
                  <span class="inline-block h-8 py-[6px] text-grey-40 w-[70px] flex-0"
                    >Đạo diễn
                    <!-- -->
                    :</span
                  >
                  <ul class="ml-2 flex flex-wrap gap-1 flex-1 mb-0">
                    <li class="inline-block">
                      <a
                        class="text-black text-sm inline-flex h-8 border border-grey-20 hover:border-primary rounded-lg px-4 py-2 capitalize not-italic items-center"
                        href="/dao-dien/gil-kenan/"
                        >{{ movieDetail.directors }}</a
                      >
                    </li>
                  </ul>
                </div>
                <div class="flex flex-nowrap items-center text-sm">
                  <span class="inline-block h-8 mt-2 py-[6px] text-grey-40 w-[70px] flex-0"
                    >Diễn viên
                    <!-- -->
                    :</span
                  >
                  <ul class="ml-2 flex flex-wrap gap-1 flex-1 mb-0">
                    <li v-for = "(actor,i) in movieDetail.actors" :key="i" class="inline-block">
                      <a
                        class="text-black text-sm inline-flex h-8 border border-grey-20 hover:border-primary rounded-lg px-4 py-2 capitalize not-italic items-center"
                        href="/dien-vien/paul-rudd/"
                        >{{ actor }}</a
                      >
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <div class="movie__info  relative md:hidden grid grid-cols-1 grid-flow-row lg:items-end">
            <div class="movie__thumbnail grid grid-cols-3 gap-3 grid-flow-col">
              <img
                alt="movieDetail.name"
                width="220"
                height="280"
               
                style="color: transparent"
                :src="movieDetail.image"
              />
              <div class="col-span-2 flex flex-col justify-center">
                <div class="item__title flex items-center">
                  <h1 class="text-[20px] md:text-[24px] lg:text-[28px] font-bold text-black-10 mr-4">
                    {{ movieDetail.name }}
                  </h1>
                  <span
                    class="inline-flex items-center justify-center w-[38px] h-7 bg-primary rounded text-sm text-center text-white font-bold not-italic"
                    >T13</span
                  >
                </div>
                <div class="flex items-center">
                  <div class="text-sm flex items-center font-semibold not-italic">
                    <svg
                      width="14"
                      height="14"
                      viewBox="0 0 14 14"
                      fill="none"
                      class="inline-block align-baseline mr-1"
                    >
                      <path
                        d="M7 0C3.13306 0 0 3.13306 0 7C0 10.8669 3.13306 14 7 14C10.8669 14 14 10.8669 14 7C14 3.13306 10.8669 0 7 0ZM7 12.6452C3.88105 12.6452 1.35484 10.119 1.35484 7C1.35484 3.88105 3.88105 1.35484 7 1.35484C10.119 1.35484 12.6452 3.88105 12.6452 7C12.6452 10.119 10.119 12.6452 7 12.6452ZM8.74435 9.69839L6.34798 7.95685C6.26048 7.89193 6.20968 7.79032 6.20968 7.68306V3.04839C6.20968 2.8621 6.3621 2.70968 6.54839 2.70968H7.45161C7.6379 2.70968 7.79032 2.8621 7.79032 3.04839V7.04798L9.67581 8.41976C9.82823 8.52984 9.85927 8.74153 9.74919 8.89395L9.21855 9.625C9.10847 9.7746 8.89677 9.80847 8.74435 9.69839Z"
                        fill="#F58020"
                      ></path>
                    </svg>
                    <span>{{ movieDetail.duration }} Phút</span>
                  </div>
                  <div class="text-sm ml-4 flex items-center font-semibold not-italic">
                    <svg
                      width="12"
                      height="14"
                      viewBox="0 0 12 14"
                      fill="none"
                      class="inline-block align-baseline mr-1"
                    >
                      <path
                        d="M10.7143 1.75H9.42857V0.328125C9.42857 0.147656 9.28393 0 9.10714 0H8.03571C7.85893 0 7.71429 0.147656 7.71429 0.328125V1.75H4.28571V0.328125C4.28571 0.147656 4.14107 0 3.96429 0H2.89286C2.71607 0 2.57143 0.147656 2.57143 0.328125V1.75H1.28571C0.575893 1.75 0 2.33789 0 3.0625V12.6875C0 13.4121 0.575893 14 1.28571 14H10.7143C11.4241 14 12 13.4121 12 12.6875V3.0625C12 2.33789 11.4241 1.75 10.7143 1.75ZM10.5536 12.6875H1.44643C1.35804 12.6875 1.28571 12.6137 1.28571 12.5234V4.375H10.7143V12.5234C10.7143 12.6137 10.642 12.6875 10.5536 12.6875Z"
                        fill="#F58020"
                      ></path>
                    </svg>
                    <span>{{ movieDetail.startDate }}</span>
                  </div>
                </div>
                <div class="mt-2">
                  <a class="text-[20px]">
                    <svg
                      aria-hidden="true"
                      focusable="false"
                      data-prefix="fas"
                      data-icon="star"
                      class="svg-inline--fa fa-star text-primary mr-1"
                      role="img"
                      xmlns="http://www.w3.org/2000/svg"
                      viewBox="0 0 576 512"
                    >
                      <path
                        fill="currentColor"
                        d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                      ></path>
                    </svg>
                    <span class="inline-block mr-1">{{ movieDetail.vote }}</span>
                    <span class="inline-block text-sm text-grey-40"
                      >(
                      <!-- -->
                      {{ movieDetail.totalVote }} votes
                      <!-- -->
                      )</span
                    >
                  </a>
                </div>
                <div class="flex flex-nowrap text-sm">
                  <span class="inline-block h-8 py-[6px] text-grey-40"
                    >Quốc gia
                    <!-- -->
                    :</span
                  >
                  <span class="inline-block h-8 ml-4 py-[6px] capitalize not-italic">{{ movieDetail.language }}</span>
                </div>
              </div>
            </div>
            <div>
              <div class="flex flex-col gap-1">
                <div class="flex flex-nowrap items-center text-sm">
                  <span class="inline-block h-8 py-[6px] text-grey-40 flex-0"
                    >Nhà sản xuất
                    <!-- -->
                    :</span
                  >
                  <ul class="ml-2 flex flex-wrap flex-1">
                    <li class="text-sm cursor-pointer hover:text-primary transition duration-500 ease-in-out">
                      <span class="mr-[5px]">Columbia Pictures</span>
                    </li>
                  </ul>
                </div>
                <div class="flex flex-nowrap items-center text-sm">
                  <span class="inline-block h-8 py-[6px] text-grey-40 w-[70px] flex-0"
                    >Thể loại
                    <!-- -->
                    :</span
                  >
                  <ul class="ml-2 flex flex-wrap gap-1 flex-1">
                    <li v-for ="(type,i) in movieDetail.movieType" :key="i" lass="inline-block">
                      <a
                        class="text-black text-sm inline-flex h-8 border border-grey-20 hover:border-primary rounded-lg px-4 py-2 capitalize not-italic items-center"
                        href="/dien-anh/hai/"
                        >{{ type }}</a
                      >
                    </li>
                  
                  </ul>
                </div>
                <div class="flex flex-nowrap items-center text-sm">
                  <span class="inline-block h-8 py-[6px] text-grey-40 w-[70px] flex-0"
                    >Đạo diễn
                    <!-- -->
                    :</span
                  >
                  <ul class="ml-2 flex flex-wrap gap-1 flex-1">
                    <li class="inline-block">
                      <a
                        class="text-black text-sm inline-flex h-8 border border-grey-20 hover:border-primary rounded-lg px-4 py-2 capitalize not-italic items-center"
                        href="/dao-dien/gil-kenan/"
                        >{{ movieDetail.directors }}</a
                      >
                    </li>
                  </ul>
                </div>
                <div class="flex flex-nowrap items-center text-sm">
                  <span class="inline-block h-8 mt-2 py-[6px] text-grey-40 w-[70px] flex-0"
                    >Diễn viên
                    <!-- -->
                    :</span
                  >
                  <ul class="ml-2 flex flex-wrap gap-1 flex-1">
                    <li v-for = "(actor,i) in movieDetail.actors" :key="i" class="inline-block">
                      <a
                        class="text-black text-sm inline-flex h-8 border border-grey-20 hover:border-primary rounded-lg px-4 py-2 capitalize not-italic items-center"
                        href="/dien-vien/paul-rudd/"
                        >{{ actor }}</a
                      >
                    </li>
                  
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <div class="movie__gallery lg:-translate-y-14">
            <div class="movie__content mt-3 lg:mt-0 snipcss-clTWL"><span class="border-l-4 border-solid border-blue-10 mr-2"></span>
                <h1 class="text-base inline-block capitalize font-bold mb-3">Nội dung phim</h1>
                <div class="block__wysiwyg text-black-10 text-sm font-normal not-italic content-text content__data__full">
                  <p>
                    {{ movieDetail.description }}
                  </p>
                    
                </div>
            </div>
          </div>
          <div class = "movie__showtime lg:-translate-y-16 mt-2">
            <div class = "movie__showtime-header">
              <span class ="border-l-4 border-solid border-blue-10 mr-2"></span>
              <h1 class = "mb-4 text-base inline-block capitalize font-bold">Lịch chiếu</h1>
            </div>
            <div class = "overflow-auto">
              <v-card>
                    <v-tabs v-model="tab" color="deep-purple-accent-4" align-tabs="center">
                        <v-tab v-for="(schedule, i) in schedules" :key="i" :value="i">
                            <h5 class="title">
                              {{ formatDay(schedule.day) }}
                            </h5>
                        </v-tab>

                    </v-tabs>
                    <v-window v-model="tab">
                        <v-window-item v-for = "(schedule,n) in schedules" :key="n" :value ="n">
                            <v-container>
                                <div class="row">
                                    <div v-for = "(start,j) in schedule.scheduleByDayDTOSet" :key = "j" class="col-md-2 col-sm-3 col-4">
                                      <div @click ="showConfirmSelectSchedule(schedule.day,start.startAt,start.scheduleId)" style="width: 100%;height:30px;
                                    background-color: #E5E5E5;color: #333333;
                                    font-size: 14px;padding: 5px 14px;display: flex; 
                                    align-items: center;justify-content: center;">
                                        {{ start.startAt }}
                                    </div>
                                    <p style="font-size: 12px;padding-top: 5px;
                                    font-family: sans-serif;font-weight: 600;display: flex;
                                    justify-content: center;">
                                    {{ start.capacity }} ghế trống</p>
                                    </div>
                                </div>
                            </v-container>
                        </v-window-item>
                    </v-window>
                </v-card>
            </div>
          </div>
        </div>
      </div>
      <div class="lg:col-span-3">
        <ListMovieSuggest/>
      </div>
    </div>

  </div>
</Global>
</template>

<script setup>
import { useMovieStore } from '~/stores/user/useMovieStore';
import { useCinemaStore } from '~/stores/user/useCinemaStore';
import { useRoute } from 'vue-router';
// import { useBookingStore } from '~/stores/user/useBookingStore';
import { useToken } from '~/composables/authentication/useToken';
import { useProfile } from '~/composables/Profile/useProfile';

 const { accessToken } = useToken()
const router = useRouter()
const { userID } = useProfile()
const isSignIn = Boolean(accessToken.value)
const isOpenTrailler = ref(false)

const movieDetail = computed(() => {
  return useMovieStore().movieDetail;
})
const schedules = computed(() => {
  return useMovieStore().schedules;
})

onMounted(() => {
  useMovieStore().getScheduleByMovie(useRoute().params.slug)
  useMovieStore().getMovieDetail(useRoute().params.slug)
})


const showTrailler = () => {
  console.log(123)
  isOpenTrailler.value = true
}
const check = () => {
  console.log(data)
}
const formatDay = (dateString) =>{
  const daysOfWeek = ['Chủ nhật', 'Thứ hai', 'Thứ ba', 'Thứ tư', 'Thứ năm', 'Thứ sáu', 'Thứ bảy'];
    const parts = dateString.split('/');
    const day = parts[0];
    const month = parts[1];
    const year = new Date().getFullYear(); // Lấy năm hiện tại
    const date = new Date(year, parseInt(month) - 1, parseInt(day)); // Tạo đối tượng Date từ ngày tháng
    const dayOfWeek = date.getDay(); // Lấy thứ của ngày
    const formattedDate = `${daysOfWeek[dayOfWeek]} ${day}/${month}`; // Kết hợp thứ và ngày tháng
    return formattedDate;
    }
const getDayOfWeek = (day, month) => {
        const year = new Date().getFullYear(); // Lấy năm hiện tại
        const date = new Date(year, parseInt(month) - 1, parseInt(day)); // Tạo đối tượng Date từ ngày tháng
        return date.getDay(); // Trả về index của ngày trong tuần (0: Chủ nhật, 1: Thứ hai, ...)
    }

const isShowConfirmSelectSchedule = ref(false)
const nameOfCinema = computed(() => {
  return useCinemaStore().nameOfCinema;
})

const selectedDay = ref('')
const selectedTime = ref('')
const schedule = ref('')


const showConfirmSelectSchedule = (day, time, scheduleId) => {
  // Tạo đối tượng Date từ ngày và giờ đầu vào
  const scheduleDateTime = parseDateAndTime(day, time);

  // Lấy thời gian hiện tại
  const now = new Date();

  // So sánh thời gian hiện tại với thời gian của lịch chiếu
  if (now > scheduleDateTime) {
    alert("Lịch chiếu đã kết thúc! Vui lòng chọn lịch chiếu khác");
  } else {
    // Nếu thời gian hiện tại đứng trước thời gian lịch chiếu, tiếp tục thực hiện
    isShowConfirmSelectSchedule.value = true;
    selectedDay.value = day;
    selectedTime.value = time;
    schedule.value = scheduleId;
  }
};

// Hàm để phân tích ngày và giờ từ đầu vào
const parseDateAndTime = (day, time) => {
  // Chuyển đổi ngày từ dạng "dd/MM/yyyy" sang "MM/dd/yyyy" để JavaScript có thể phân tích chính xác
  const dayParts = day.split('/');
  const formattedDate = `${dayParts[1]}/${dayParts[0]}/${dayParts[2]}`;

  // Tạo đối tượng Date kết hợp ngày và giờ
  return new Date(`${formattedDate} ${time}`);
};

const booking = () => {
    // useBookingStore().getAllSeat(schedule.value)
    if(!isSignIn) {
      router.replace({
            name: "login",
            query: { redirect: `/booking/${schedule.value}` } 
        })
    }else {
      router.replace(`/booking/${schedule.value}`)
    }

    isShowConfirmSelectSchedule.value = false
}
const tab = ref(null)
</script>

<style>
</style>
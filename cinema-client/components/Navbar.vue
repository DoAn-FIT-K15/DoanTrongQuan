<template>
  <div class="">
    <USlideover v-model="isOpen" class ="z-[51]" prevent-close :ui="{ width: 'max-w-xs' }">
      <div class="p-3">
        <div class="flex justify-end">
          <UButton
            color="gray"
            variant="ghost"
            icon="i-heroicons-x-mark-20-solid"
            class="-my-1"
            @click="isOpen = false"
          />
        </div>
        <div class="pl-8">
          <div
            class="px-2 py-2 relative items-center text-left md:cursor-pointer group transition-all duration-500 ease-in-out flex snipcss0-0-0-1 XXsnipcss_extracted_selector_selectionXX tether-element-attached-top tether-element-attached-center tether-target-attached-top tether-target-attached-center"
          >
            <div
              class="w-[40px] h-[40px] leading-[62px] text-center rounded-full bg-[#D0D0D0] border-4 border-solid border-[#E9E9E2] flex-none mr-2 snipcss0-1-1-2"
            >
              <img
                alt="Avatar"
                loading="lazy"
                width="40"
                height="40"
                decoding="async"
                data-nimg="1"
                class="w-full h-full rounded-full object-cover duration-500 ease-in-out group-hover:opacity-100&quot; scale-100 blur-0 grayscale-0) snipcss0-2-2-3"
                src="/img/user-avatar.png"
                style="color: transparent"
              />
            </div>
            <div class="flex flex-col items-center">
              <div class="flex items-center justify-center snipcss0-2-4-5">
                <img class="inline-block w-[20px] h-[30px] snipcss0-3-5-6" src="/img/star-user.png" />
                <p class="m-0">{{ userName }}</p>
              </div>
            </div>
          </div>
          <div class="flex flex-col cursor-pointer">
            <div @click="showAccout" v-if = "isLogin" class="my-2 font-normal hover:text-[#FF7614]">Thông tin cá nhân</div>
            <NuxtLink to = "/blog"><div class="my-2 font-normal hover:text-[#FF7614]">Góc điện ảnh</div></NuxtLink>
            <NuxtLink to = "/event"><div class="my-2 font-normal hover:text-[#FF7614]">Sự kiện/Khuyến mãi</div></NuxtLink>
            <NuxtLink to = "/"><div class="my-2 font-normal hover:text-[#FF7614]">Phim</div></NuxtLink>
            <div v-if="isLogin" @click = "logout"  class="my-2 font-normal hover:text-[#FF7614]">Đăng xuất</div>
            <div v-else @click = "login">Đăng nhập</div>
          </div>
        </div>
      </div>
    </USlideover>
  </div>
  <div class="header !bg-white" style="position: sticky; top: 0; z-index: 51; cursor: pointer">
    <div class="my-0 mx-auto lg:w-[86%] py-7">
      <div class="grid grid-cols-12 items-center">
          <a href="/" class="lg:col-span-2 col-span-4 flex items-center justify-center lg:justify-start">
          <img  
            src="/img/logo_cinema.png"
            class="w-full xl:max-w-[300px] sm:max-w-[150px] xs:max-w-[100px] object-cover duration-300 ease-in-out hover:opacity-100 hover:scale-110 hover:blur-0 hover:grayscale-0"
          />
        </a>

        <div class="lg:col-span-2 pl-2 col-span-4 lg:flex lg:justify-center">
            <div
              class="dropdown "

            >
              <button
                style="
                  color: black;
                  font-size: 15px;
                  font-weight: bold;
                  font-family: Arial, Helvetica, sans-serif;
                  width: auto;border-radius: 16px; border: 1px solid black;
                  align-items: center;
                "
                class="btn dropdown-toggle max-w-[200px] "
                type="button"
                id="dropdownMenuButton1"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                {{ nameOfCinema }}
              </button>
              <ul class="dropdown-menu absolute top-[38px] max-w-[230px]" aria-labelledby="dropdownMenuButton1">
                <li
                  v-for="(cinema, i) in cinemas"
                  :key="i"
                  class="dropdown-item "
                  style="border-bottom: 1px solid #efefef"
                >
                  <div class="dropdown dropend">
                    <button
                      style="color: #767f88; font-weight: 400; cursor: pointer; font-size: 14px"
                      class="btn dropdown-toggle"
                      type="button"
                      id="dropdownMenuButton1"
                      data-bs-toggle="dropdown"
                      aria-expanded="false"
                    >
                      {{ cinema.address }}
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                      <li v-for="(children, i) in cinema.children" :key="i">
                        <a @click.prevent="changeNameOfCinema(children)" class="dropdown-item" href="#">{{ children }}</a>
                      </li>
                    </ul>
                  </div>
                </li>
              </ul>
            </div>
          
        </div>

        <div class="hidden lg:grid grid-cols-4 col-span-6 items-center mx-4 ">
          <NuxtLink to = "/blog" class = "no-underline">
          <div class = "no-underline text-black col-span-1 pr-2 md:justify-center font-bold font-sans flex lg:justify-start text-lg hover:text-[#FF7614] transition duration-100 ease-in-out transform hover:scale-105"
          >
            Góc điện ảnh
          </div>
        </NuxtLink>
        <NuxtLink to = "/event" class = "no-underline text-black col-span-2 pr-2 md:justify-center font-bold  flex lg:justify-center text-lg hover:text-[#FF7614] transition duration-100 ease-in-out transform hover:scale-105">
          <div
           
          >
            Sự kiện/Khuyến mãi
          </div>
        </NuxtLink>
        <NuxtLink to="/" class = "no-underline text-black col-span-1 pr-2 md:justify-center font-bold  flex lg:justify-start text-lg hover:text-[#FF7614] transition duration-100 ease-in-out transform hover:scale-105"">
            <div
           
          >
            Phim
          </div>
          </NuxtLink>

          
        </div>
        <div class="flex lg:col-span-2 col-span-4 lg:justify-center justify-end items-center">
          <div v-if="isLogin" class="flex items-center  justify-end">
            <UDropdown
              :items="items"
              mode="hover"
              :popper="{ placement: 'bottom-start' }"
            >
              <p  class="mr-3 mb-1 font-bold hidden sm:block">{{ userName }}</p>
            </UDropdown>
          </div>
          <div v-else class="flex justify-end items-center">
            <NuxtLink to="/login" class="no-underline text-black"
              ><span class="hover:bg-[#FF7614] hover:text-white p-2 rounded-lg hidden sm:block">Đăng nhập</span></NuxtLink
            >
          </div>
          <svg
            class="lg:hidden block mx-4"
            @click="isOpen = true"
            width="20"
            height="14"
            viewBox="0 0 20 14"
            fill="none"
          >
            <path
              fill-rule="evenodd"
              clip-rule="evenodd"
              d="M1.05263 2C0.761955 2 0 1.55228 0 1C0 0.447715 0.761955 0 1.05263 0H18.9474C19.238 0 20 0.447715 20 1C20 1.55228 19.238 2 18.9474 2H1.05263ZM6.89744 8C6.69918 8 6 7.55228 6 7C6 6.44772 6.69918 6 6.89744 6H19.1026C19.3008 6 20 6.44772 20 7C20 7.55228 19.3008 8 19.1026 8H6.89744ZM0 13C0 13.5523 0.761955 14 1.05263 14H18.9474C19.238 14 20 13.5523 20 13C20 12.4477 19.238 12 18.9474 12H1.05263C0.761955 12 0 12.4477 0 13Z"
              fill="#777777"
            ></path>
          </svg>
        </div>
      </div>
    </div>
  </div>
</template>
  
<script setup>

import { useCinemaStore } from '@/stores/user/useCinemaStore.js'
import { useMovieStore } from '@/stores/user/useMovieStore.js'

import { useAuth } from '~/composables/authentication/useAuth'

const router = useRouter()
const route = useRoute()

const store = useCinemaStore()
const isOpen = ref(false)
const cinemas = computed(() => {
  return store.cinemas
})
const nameOfCinema = computed(() => {
  return store.nameOfCinema
})
store.getAllCinemas()
import { useToken } from '~/composables/authentication/useToken'
const { accessToken } = useToken()

import { useProfile } from '~/composables/Profile/useProfile'
const { userName } = useProfile()

const { logout } = useAuth()

const isLogin = computed(() => {
  return Boolean(accessToken.value)
})

const login = () => {
  isOpen.value = false
  router.replace("/")
}

const handleMenu = item => {
  if (item === 'account') {
    router.replace('/tai-khoan')
  }
  if (item === 'logout') {
    logout()
    
  }
}

const changeNameOfCinema = data => {
  store.setNameOfCinema(data)
  //sau khi tên rạp thay đổi thì lập tức gọi api để lấy list phim của rạp đó
  useMovieStore().getAllMovieByCinema(nameOfCinema.value)

  if (route.fullPath != '/login' || route.fullPath != '/signup' || route.fullPath != '/') {
    router.replace('/')
  }
}

const items = [
  [{
    label: 'Thông tin cá nhân',
    click: () => {
      router.replace('/tai-khoan')
    }
  }], [{
    label: 'Đăng xuất',
    click: () => {
      logout()
      window.location.reload();
    }
  }]
]

const showAccout = () => {
  router.replace('/tai-khoan')
  isOpen.value = false
}
</script>

<style scoped>
.header-content {
  background: gold;
}

.header {

}
.dropdown-item {
  padding: 0 !important;
}
.dropdown-item:hover {
  color: black;
}
.dropdown:hover > .dropdown-menu,
.dropend:hover > .dropdown-menu {
  display: block;
}
.dropend .dropdown-menu li {
  padding-left: 10px;
}
.dropdown button {
  width: 100%;
  display: flex;
  justify-content: space-between;
}
@media screen and (min-width: 577px) {
  .dropend:hover > .dropdown-menu {
    position: absolute;
    top: 0;
    left: 161px;
  }
}
</style>
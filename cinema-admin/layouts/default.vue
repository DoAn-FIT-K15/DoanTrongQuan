<script setup >
import { useAuth } from '~/composables/authentication/useAuth';
import { useProfile } from '~/composables/useProfile'
const route = useRoute()
const appConfig = useAppConfig()
const router = useRouter()
const { logout } = useAuth()
const { userName } = useProfile()

const links = [{
  id: 'home',
  label: 'Trang chủ',
  icon: 'i-heroicons-home',
  to: '/',
  tooltip: {
    text: 'Home',
    shortcuts: ['G', 'H']
  }
}, {
  id: 'inbox',
  label: 'Quản lí hóa đơn',
  icon: 'i-heroicons-shopping-cart-20-solid',
  to: '/bill',
}, {
  id: 'users',
  label: 'Quản lí người dùng',
  icon: 'i-heroicons-user-group',
  to: '/users',
  tooltip: {
    text: 'Users',
    shortcuts: ['G', 'U']
  }
}, 
 {
    label: 'Quản lí phim',
    icon: 'i-heroicons-play-circle-16-solid',
    to: '/cinema/movie',
    exact: true
  }, {
    label: 'Quản lí lịch chiếu',
    icon: 'i-heroicons-calendar-days-20-solid',
    to: '/cinema/schedule'
  },
  {
    label: 'Quản lí đồ ăn',
    icon: 'i-heroicons-gift-top-20-solid',
    to: '/cinema/food'
  },
{
  id: 'content',
  label: 'Quản lý Sự kiện, Khuyến mãi',
  icon: 'i-heroicons-gift-solid',
  to: '/event',
},
{
  id: 'blog',
  label: 'Quản lí blog',
  icon: 'i-heroicons-inbox',
  to: '/blog',
}
]

const drawer = ref(null)

const items = [
  [{
    label: 'Thông tin cá nhân',
    click: () => {
      // router.replace('/tai-khoan')
    }
  }], [{
    label: 'Đăng xuất',
    click: () => {
      logout()
    }
  }]
]
</script>

<template>
  <v-app id="inspire">
    <v-navigation-drawer expand-on-hover floating width="320"  v-model="drawer">
      <div class = "py-5 px-2">
        <div class = "max-w-[200px] max-h-[100px] pb-3">
          <img src = "/img/logo_cinema.png">
        </div>
        <UVerticalNavigation :links="links" :ui = "{padding:'py-3 px-3', size:'text-lg'}">
          <template #default="{ link }">
            <span class="group-hover:text-primary relative">{{ link.label }}</span>
          </template>
        </UVerticalNavigation>
      </div>

    </v-navigation-drawer>

    <v-app-bar>
      <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>
      <v-app-bar-title>Quản lý rạp chiếu phim</v-app-bar-title>
      <UDropdown
              :items="items"
              mode="hover"
              :popper="{ placement: 'bottom-start' }"
            >
              <p class="mr-3 mb-1 font-bold ">{{ userName }}</p>
            </UDropdown>
      
    </v-app-bar>

    <v-main>
      <div class = "px-4">
        <slot/>
      </div>
      
    </v-main>
  </v-app>
</template>

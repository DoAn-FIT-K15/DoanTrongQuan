<template>
    <Global>
    <div class="grid grid-cols-1 xl:grid-cols-6 my-0 mx-auto xl:max-w-[90%] xl:max-w-screen-screen1200 lg:max-w-4xl md:max-w-4xl gap-8 py-7 px-4 lg:px-0">
      <div class = "xl:col-span-4">
        <p><span>Trang chủ </span> / <span>Sự kiện</span> / <span>{{ eventDetail.name }}</span></p>
        <h1>{{ eventDetail.name }}</h1>
        <div v-html="cleanHTML">
        </div>
      </div>
      <div class="xl:col-span-2">
        <ListMovieSuggest/>
      </div>
    </div>
</Global>
  </template>
  <script setup>
import { usePromotionStore } from '~/stores/user/usePromotionStore'
  import DOMPurify from 'dompurify';
  
  
  const promotionStore = usePromotionStore()
  const route = useRoute();
  
  // lấy dữ liệu blog theo id
  onMounted(
    () => {
        promotionStore.getPromotionDetail(route.params.id) 
    }
  )

  const eventDetail = computed(() =>{ 
    return promotionStore.eventDetail;
  })
  
  const cleanHTML = computed(() => DOMPurify.sanitize(eventDetail.value.description || ''));
  
  
  
  </script>
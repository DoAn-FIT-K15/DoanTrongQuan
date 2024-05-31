<template>
  <div class="grid grid-cols-1 xl:grid-cols-6 my-0 mx-auto xl:max-w-[90%] xl:max-w-screen-screen1200 lg:max-w-4xl md:max-w-4xl gap-4 py-7 px-4 lg:px-0">
    <div class="xl:col-span-4">
      <p><span>Trang chủ </span> / <span>Blog</span> / <span>{{ blogDetail.name }}</span></p>
      <h1>{{ blogDetail.name }}</h1>
      <div v-html="blogDetail.content"></div>
    </div>
    <div class="xl:col-span-2">
      <ListMovieSuggest/>
    </div>
  </div>
</template>

<script setup>
import { useBlogStore } from '~/stores/user/useBlogStore';
import DOMPurify from 'dompurify';;

const blogStore = useBlogStore();
const route = useRoute();

onMounted(() => {
  // Lấy dữ liệu blog theo id
blogStore.getBlogDetail(route.params.id);
})


const blogDetail = computed(() => blogStore.blogDetail);

// Làm sạch nội dung HTML
const cleanHTML = computed(() => DOMPurify.sanitize(blogDetail.value.content || ''));

</script>
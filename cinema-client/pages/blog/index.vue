<template>
  <Global>
  <div class="grid grid-cols-1 xl:grid-cols-6 my-0 mx-auto screen1390:max-w-screen-xl xl:max-w-screen-screen1200 lg:max-w-4xl md:max-w-4xl gap-8 py-7 px-4 lg:px-0">
    <div class = "xl:col-span-4 ">
      <div class="border-b-2 border-blue-10 snipcss-bNwPy"><span class="border-l-4 border-solid border-blue-10 mr-2"></span>
        <h1 class="mb-4 text-xl inline-block uppercase font-medium">Blog điện ảnh</h1>
      </div>
      <div class = "flex flex-col">
        <div v-for ="(blog,i) in blogs" :key = "i" class = "flex gap-3 mt-3">
          <NuxtLink :to="`/blog/${blog.id}`"><div class = "rounded w-[109px] h-[79px] md:w-[255px] md:h-[170px] object-cover duration-500 ease-in-out group-hover:opacity-100&quot; scale-100 blur-0 grayscale-0) snipcss0-2-2-3">
            <img class = "w-full h-full" :src = "blog.image"></div></NuxtLink>
          <div class = "flex flex-col">
            <NuxtLink :to="`/blog/${blog.id}`" class="no-underline"><h3 @click = "showBlogDetail(blog.id)">{{ blog.name }}</h3></NuxtLink>
            <p>{{ blog.description }}</p>
          </div>
        </div>
      </div>
    </div>
    <div class = "xl:col-span-2">
      <ListMovieSuggest/>
    </div>
    
  </div>
</Global>
</template>
<script setup>
import { useBlogStore } from '~/stores/user/useBlogStore';

const blogStore = useBlogStore();


//lấy tất cả blog
blogStore.getAllBlog()


const blogs = computed(() => {
  return blogStore.blogs;
})


</script>

<style scoped>
body {  
    line-height:inherit;
    font-family:Nunito Sans,sans-serif!important;
    color:#4a4a4a;
    font-weight:400;
  }  
body { 
/* CSS Variables that may have been missed get put on body */ 
    --tw-border-opacity:  1;  
} 

* { 
    box-sizing: border-box; 
    border: 0 solid #e5e7eb;
} 

@media (min-width: 1024px){ 
  .lg\:col-span-4 { 
    grid-column: span 4/span 4;
  } 
}     

@media (min-width: 768px){ 
  .md\:max-w-4xl { 
    max-width: 56rem;
  } 
}     

@media (min-width: 1024px){ 
  .lg\:max-w-4xl { 
    max-width: 56rem;
  } 

  .lg\:px-0 { 
    padding-left: 0; 
    padding-right: 0;
  } 
}     

@media (min-width: 1200px){ 
  .screen1200\:grid-cols-6 { 
    grid-template-columns: repeat(6,minmax(0,1fr));
  } 
}     

@media (min-width: 1280px){ 
  .xl\:max-w-screen-screen1200 { 
    max-width: 1200px;
  } 
}     

@media (min-width: 1390px){ 
  .screen1390\:max-w-screen-xl { 
    max-width: 1280px;
  } 
}     

body { 
    overflow-y: auto;
} 

body { 
    margin: 0; 
    line-height: inherit;
} 

body { 
    font-family: Nunito Sans,sans-serif!important; 
    color: #4a4a4a; 
    font-weight: 400;
} 

body { 
    overflow-x: hidden; 
    overflow-y: auto;
} 

html { 
    line-height: 1.5; 
    -webkit-text-size-adjust: 100%; 
    -moz-tab-size: 4; 
    -o-tab-size: 4; 
    tab-size: 4; 
    font-family: ui-sans-serif,system-ui,-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Arial,Noto Sans,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol,Noto Color Emoji; 
    font-feature-settings: normal; 
    font-variation-settings: normal;
} 

html { 
    font-family: Nunito Sans,sans-serif!important; 
    color: #4a4a4a; 
    font-weight: 400;
} 

.border-b-2 { 
    border-bottom-width: 2px;
} 

.border-blue-10 { 
    --tw-border-opacity: 1; 
    border-color: rgb(3 78 162/var(--tw-border-opacity));
} 

*,:after,:before { 
    box-sizing: border-box; 
    border: 0 solid #e5e7eb;
} 

.mr-2 { 
    margin-right: .5rem;
} 

.border-l-4 { 
    border-left-width: 4px;
} 

.border-solid { 
    border-style: solid;
} 

h1 { 
    font-size: inherit; 
    font-weight: inherit;
} 

h1 { 
    margin: 0;
} 

.mb-4 { 
    margin-bottom: 1rem;
} 

.inline-block { 
    display: inline-block;
} 

.text-xl { 
    font-size: 1.25rem;
} 

.font-medium { 
    font-weight: 500;
} 

.uppercase { 
    text-transform: uppercase;
} 

</style>
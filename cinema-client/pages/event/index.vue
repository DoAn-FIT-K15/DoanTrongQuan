<template>
          <div class="border-b-2 max-w-[85%] mx-auto border-blue-10 snipcss-bNwPy"><span class="border-l-4 border-solid border-blue-10 mr-2"></span>
          <h1 class="mb-0 text-xl inline-block uppercase font-medium">Ưu đãi</h1>
        </div>
  <div class = "grid grid-cols-1 xl:grid-cols-6 my-0 mx-auto xl:max-w-[85%] xl:max-w-screen-screen1200 lg:max-w-4xl md:max-w-4xl gap-6 pb-7 px-4">
    
      <div class="py-4 lg:col-span-4 grid grid-cols-3 md:gap-[20px] justify-between md:justify-start">
        <div v-for = "(event,i) in events" :key = "i" class="mb-6 md:mr-0 cursor-pointer relative col-span-1">
          <NuxtLink :to="`/event/${event.id}`">
            <div class="relative group">
              <img alt="Cine Với Cạ Cứng - Tụ Tập Vui" loading="lazy" width="200" height="320" decoding="async" data-nimg="1" class="rounded w-[140px] screen375:w-[170px] screen425:w-[180px] h-[235px] md:w-[200px] md:h-[300px] lg:w-[255px] lg:h-[380px] object-cover duration-500 ease-in-out group-hover:opacity-100 scale-100 blur-0 grayscale-0 style-F6g1j" :src="event.image">
            </div>
          </NuxtLink>
        </div>
      </div>
    <div class = "xl:col-span-2">
      <ListMovieSuggest/>
    </div>
  </div>

</template>

<script setup>
import { usePromotionStore } from '~/stores/user/usePromotionStore'

const promotionStore = usePromotionStore()



onMounted(
  () => {
   promotionStore.getAllPromotion()
    
  }
)
const events = computed(() => {
  return promotionStore.events;
})
</script>

<style scoped>
  body {  
    line-height:1.5;
    font-family:Nunito Sans,sans-serif!important;
    color:#4a4a4a;
    font-weight:400;
  }  
body { 
/* CSS Variables that may have been missed get put on body */ 
    --tw-translate-x:  0;  
    --tw-translate-y:  0;  
    --tw-rotate:  0;  
    --tw-skew-x:  0;  
    --tw-skew-y:  0;  
    --tw-scale-x:  1;  
    --tw-scale-y:  1;  
    --tw-translate-x:  0;  
    --tw-translate-y:  0;  
    --tw-rotate:  0;  
    --tw-skew-x:  0;  
    --tw-skew-y:  0;  
    --tw-scale-x:  1;  
    --tw-scale-y:  1;  
    --tw-translate-x:  0;  
    --tw-translate-y:  0;  
    --tw-rotate:  0;  
    --tw-skew-x:  0;  
    --tw-skew-y:  0;  
    --tw-scale-x:  1;  
    --tw-scale-y:  1;  
    --tw-scale-x:  1;  
    --tw-scale-y:  1; 
    --tw-blur:  blur(0); 
} 

* { 
    box-sizing: border-box; 
    border: 0 solid #e5e7eb;
} 

* { 
    --tw-translate-x: 0; 
    --tw-translate-y: 0; 
    --tw-rotate: 0; 
    --tw-skew-x: 0; 
    --tw-skew-y: 0; 
    --tw-scale-x: 1; 
    --tw-scale-y: 1; 
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

.flex { 
    display: flex;
} 

.flex-wrap { 
    flex-wrap: wrap;
} 

.justify-between { 
    justify-content: space-between;
} 

.py-4 { 
    padding-top: 1rem; 
    padding-bottom: 1rem;
} 

@media (min-width: 768px){ 
  .md\:justify-start { 
    justify-content: flex-start;
  } 

  .md\:gap-\[20px\] { 
    gap: 20px;
  } 
}     

*,:after,:before { 
    box-sizing: border-box; 
    border: 0 solid #e5e7eb;
} 

*,:after,:before { 
    --tw-translate-x: 0; 
    --tw-translate-y: 0; 
    --tw-rotate: 0; 
    --tw-skew-x: 0; 
    --tw-skew-y: 0; 
    --tw-scale-x: 1; 
    --tw-scale-y: 1; 
} 

:backdrop { 
    --tw-translate-x: 0; 
    --tw-translate-y: 0; 
    --tw-rotate: 0; 
    --tw-skew-x: 0; 
    --tw-skew-y: 0; 
    --tw-scale-x: 1; 
    --tw-scale-y: 1; 
} 

a { 
    color: inherit; 
    text-decoration: inherit;
} 

.relative { 
    position: relative;
} 

.mb-6 { 
    margin-bottom: 1.5rem;
} 

.cursor-pointer { 
    cursor: pointer;
} 

@media (min-width: 768px){ 
  .md\:mr-0 { 
    margin-right: 0;
  } 
}     

img { 
    display: block; 
    vertical-align: middle;
} 

img { 
    max-width: 100%;
} 

img { 
    max-width: auto!important;
} 

img { 
    max-width: auto; 
    height: auto;
} 

.h-\[235px\] { 
    height: 235px;
} 

.w-\[140px\] { 
    width: 140px;
} 

.scale-100 { 
    --tw-scale-x: 1; 
    --tw-scale-y: 1;
} 

.scale-100 { 
    transform: translate(var(--tw-translate-x),var(--tw-translate-y)) rotate(var(--tw-rotate)) skewX(var(--tw-skew-x)) skewY(var(--tw-skew-y)) scaleX(var(--tw-scale-x)) scaleY(var(--tw-scale-y));
} 

.rounded { 
    border-radius: .25rem;
} 

.object-cover { 
    -o-object-fit: cover; 
    object-fit: cover;
} 

.blur-0 { 
    filter: var(--tw-blur) var(--tw-brightness) var(--tw-contrast) var(--tw-grayscale) var(--tw-hue-rotate) var(--tw-invert) var(--tw-saturate) var(--tw-sepia) var(--tw-drop-shadow);
} 

.blur-0 { 
    --tw-blur: blur(0);
} 

.duration-500 { 
    transition-duration: .5s;
} 

.ease-in-out { 
    transition-timing-function: cubic-bezier(.4,0,.2,1);
} 

@media (min-width: 376px){ 
  .screen375\:w-\[170px\] { 
    width: 170px;
  } 
}     

@media (min-width: 425px){ 
  .screen425\:w-\[180px\] { 
    width: 180px;
  } 
}     

@media (min-width: 768px){ 
  .md\:h-\[300px\] { 
    height: 300px;
  } 

  .md\:w-\[200px\] { 
    width: 200px;
  } 
}     

@media (min-width: 1024px){ 
  .lg\:h-\[380px\] { 
    height: 380px;
  } 

  .lg\:w-\[255px\] { 
    width: 255px;
  } 
}     

.promotion__item .promotion__decription  { 
    position: absolute; 
    top: 0; 
    left: 0; 
    bottom: 0; 
    right: 0; 
    width: 100%; 
    
    background: #00000080; 
    transition: all .3s ease-in-out; 
    opacity: 0; 
    border-radius: 4px;
} 

.promotion__item:hover .promotion__decription { 
    opacity: 1;
} 

p { 
    margin: 0;
} 

.promotion__decription > p  { 
    position: absolute; 
    width: 100%; 
    top: 50%; 
    left: 50%; 
    transform: translate(-50%,-50%); 
    color: #fff; 
    font-size: 16px; 
    font-weight: 700; 
    text-align: center;
} 


/* These were inline style tags. Uses id+class to override almost everything */
#style-F6g1j.style-F6g1j {  
   color: transparent;  
}  
#style-IUcAa.style-IUcAa {  
   color: transparent;  
}  
#style-SBjqE.style-SBjqE {  
   color: transparent;  
}  
#style-LrsRX.style-LrsRX {  
   color: transparent;  
}  
#style-BFnwO.style-BFnwO {  
   color: transparent;  
}  
#style-RlG2j.style-RlG2j {  
   color: transparent;  
}  
#style-hcDdo.style-hcDdo {  
   color: transparent;  
}  
#style-9OTEV.style-9OTEV {  
   color: transparent;  
}  
#style-gA16C.style-gA16C {  
   color: transparent;  
}  
#style-s8Frd.style-s8Frd {  
   color: transparent;  
}  
#style-F2cJq.style-F2cJq {  
   color: transparent;  
}  
  body {  
    line-height:1.5;
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

.border-\[\#034ea2\] { 
    --tw-border-opacity: 1; 
    border-color: rgb(3 78 162/var(--tw-border-opacity));
} 

h1 { 
    font-size: inherit; 
    font-weight: inherit;
} 

h1 { 
    margin: 0;
} 

.inline-block { 
    display: inline-block;
} 

.text-xl { 
    font-size: 1.25rem;
} 

.font-bold { 
    font-weight: 700;
} 

.uppercase { 
    text-transform: uppercase;
} 

.group:hover img {
    transform: translateY(-2px) scale(1.02); /* Hiệu ứng nhảy nhẹ và phóng to */
  }

  .group:hover .absolute {
    opacity: 1; /* Hiển thị chữ "hello" */
  }

  img {
    transition: transform 0.1s ease, filter 0.1s ease; /* Thêm hiệu ứng chuyển tiếp */
  }

  .absolute {
    transition: opacity 0.1s ease; /* Thêm hiệu ứng chuyển tiếp cho chữ "hello" */
  }

</style>
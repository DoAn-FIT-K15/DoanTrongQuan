<template>
                              <div class="tab-35 snipcss-oMjeW">
                                <div class="option-title" @click = "showPoint"><i id="beta-point_icon" class="fa font-16 fa-arrow-circle-down"></i> Điểm Space <span class="font-12 style-eZhop" id="style-eZhop">(Nhấn vào đây để xem điểm tích lũy của bạn)</span></div>
                                <div v-if = "isShowpoint" id="beta-point" class="">
                                    <div class="col-lg-4 col-md-4 col-sm-16 col-xs-16 font-family-san">
                                        <label>Điểm hiện có</label><br>
                                        <div class="point-value">{{ point }}</div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-16 col-xs-16 font-family-san">
                                        <label>Nhập điểm</label><br>
                                        <input type="number" v-model="pointInput" class="voucher-code-input">
                                        <div class="point-note"></div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-16 col-xs-16 font-family-san">
                                        <label>Số tiền được giảm</label><br>
                                        <div class="point-money">{{ discountMoney }} vnđ</div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-16 col-xs-16">
                                        <label>&nbsp;</label><br>
                                        <button type="button" @click="confirmDoiDiem()" class="btn btn-3 btn-mua-ve style-7xlKo" id="style-7xlKo"> ĐỔI ĐIỂM</button>
                                    </div>
                                </div>
                            </div>
</template>

<script setup>
import { useBookingStore } from '~/stores/user/useBookingStore';

const bookingStore = useBookingStore()

//lấy số điểm hiện có
bookingStore.getPoint()

const point  = computed(() => {
    return bookingStore.point
})

const totalMoney = computed(() => {
    return bookingStore.totalMoney;
})
const finalAmount = computed(() => {
    return bookingStore.finalAmount;
})
const discountAmount = computed(() => {
    return bookingStore.discountAmount;
})
const isShowpoint = ref(false)
const pointInput = ref(0)
const discountMoney = ref('')

const showPoint = () => {
    isShowpoint.value = !isShowpoint.value;
}

const confirmDoiDiem = () => {
    if(pointInput.value > point.value) {
        alert("Vượt quá số điểm hiện có")
    }else{
        bookingStore.discountAmount =  discountAmount.value + pointInput.value;
        if(bookingStore.finalAmount === 0) {
            bookingStore.finalAmount = totalMoney.value - pointInput.value;
        }else{
            bookingStore.finalAmount = finalAmount.value - pointInput.value;
        }
        bookingStore.point = bookingStore.point - pointInput.value;
       
    }
}

watch(() => pointInput.value, (newValue, oldValue) => {
    discountMoney.value = newValue;

});



</script>

<style scoped>

@font-face { 
  font-family:'FontAwesome';
  src:url('https://betacinemas.vn/Assets/Common/Plugins/font-awesome/fonts/fontawesome-webfont.eot?v=4.3.0');
  src:url('https://betacinemas.vn/Assets/Common/Plugins/font-awesome/fonts/fontawesome-webfont.eot?#iefix&v=4.3.0') format('embedded-opentype'),url('https://betacinemas.vn/Assets/Common/Plugins/font-awesome/fonts/fontawesome-webfont.woff2?v=4.3.0') format('woff2'),url('https://betacinemas.vn/Assets/Common/Plugins/font-awesome/fonts/fontawesome-webfont.woff?v=4.3.0') format('woff'),url('https://betacinemas.vn/Assets/Common/Plugins/font-awesome/fonts/fontawesome-webfont.ttf?v=4.3.0') format('truetype'),url('https://betacinemas.vn/Assets/Common/Plugins/font-awesome/fonts/fontawesome-webfont.svg?v=4.3.0#fontawesomeregular') format('svg');
  font-weight:normal;
  font-style:normal;
} 

@font-face { 
  font-family:SourceSansPro;
  src:url('https://betacinemas.vn/fonts/SourceSansPro-Regular.ttf') format('truetype');
} 
  body {  
    font-family:sans-serif;
    font-size:10px;
    line-height:1.42857143;
    color:#333333;
    direction:ltr;
  }  
* { 
    -webkit-box-sizing: border-box; 
    -moz-box-sizing: border-box; 
    box-sizing: border-box;
} 

div { 
    -webkit-border-radius: 0 !important; 
    -moz-border-radius: 0 !important; 
    border-radius: 0 !important;
} 

.col-md-11,.col-lg-11,.col-xs-16,.col-sm-16 { 
    position: relative; 
    min-height: 1px; 
    padding-right: 15px; 
    padding-left: 15px;
} 

.col-xs-16 { 
    float: left;
} 

.col-xs-16 { 
    width: 100%;
} 

@media (min-width: 768px){ 
  .col-sm-16 { 
    float: left;
  } 

  .col-sm-16 { 
    width: 100%;
  } 
}     

body { 
    margin: 0;
} 

body { 
    font-family: Arial; 
    font-size: 14px; 
    line-height: 1.42857143; 
    color: #333; 
    background-color: #F1F1F1;
} 

body { 
    color: #333333; 
    font-family: "Open Sans", sans-serif; 
    padding: 0px !important; 
    margin: 0px !important; 
    font-size: 13px; 
    direction: ltr;
} 

body { 
    font-family: Oswald !important; 
    background-color: #f8f8f8;
} 

html { 
    font-family: sans-serif; 
    -ms-text-size-adjust: 100%; 
    -webkit-text-size-adjust: 100%;
} 

html { 
    font-size: 10px; 
    -webkit-tap-highlight-color: rgba(0,0,0,0);
} 

html { 
    font-family: Oswald !important;
} 

.tab-35 { 
    margin-top: 25px; 
    float: left; 
    width: 100%;
} 

:before,:after { 
    -webkit-box-sizing: border-box; 
    -moz-box-sizing: border-box; 
    box-sizing: border-box;
} 

:selection { 
    color: #fff; 
    background: #e45000;
} 

:selection { 
    color: #fff; 
    background: #337ab7;
} 

:-webkit-scrollbar { 
    width: 12px;
} 

:-webkit-scrollbar-thumb { 
    background-color: #cecece;
} 

:-webkit-scrollbar-thumb { 
    border-radius: 0; 
    box-shadow: none; 
    border: 0;
} 

:-webkit-scrollbar-thumb:hover { 
    background-color: #aaa;
} 

:-webkit-scrollbar-track { 
    background-color: #eaeaea; 
    border-left: 1px solid #cecece;
} 

:-webkit-scrollbar-track { 
    border-radius: 0; 
    box-shadow: none; 
    border: 0;
} 

.option-title { 
    font-family: SourceSansPro; 
    font-size: 18px; 
    margin-bottom: 25px; 
    border-bottom: 1px solid #ccc; 
    padding-bottom: 10px; 
    font-weight: bold;
} 

.fa { 
    display: inline-block; 
    font: normal normal normal 14px/1 FontAwesome; 
    font-size: inherit; 
    text-rendering: auto; 
    -webkit-font-smoothing: antialiased; 
    -moz-osx-font-smoothing: grayscale; 
    transform: translate(0, 0);
} 

 [class*=" fa-"] { 
    display: inline-block; 
    margin-top: 1px; 
    font-size: 14px; 
    line-height: 14px; 
    -webkit-font-smoothing: antialiased;
} 

.font-16 { 
    font-size: 16px;
} 

.fa-arrow-circle-down:before { 
    content: "\f0ab";
} 

span { 
    -webkit-border-radius: 0 !important; 
    -moz-border-radius: 0 !important; 
    border-radius: 0 !important;
} 

.font-12 { 
    font-size: 15px;
} 

.col-md-4,.col-lg-4,.col-xs-16,.col-sm-16 { 
    position: relative; 
    min-height: 1px; 
    padding-right: 15px; 
    padding-left: 15px;
} 

@media (min-width: 992px){ 
  .col-md-4 { 
    float: left;
  } 

  .col-md-4 { 
    width: 25%;
  } 
}     

@media (min-width: 1200px){ 
  .col-lg-4 { 
    float: left;
  } 

  .col-lg-4 { 
    width: 25%;
  } 
}     

.font-family-san { 
    font-family: SourceSansPro !important;
} 

label { 
    display: inline-block; 
    max-width: 100%; 
    margin-bottom: 5px; 
    font-weight: bold;
} 

label { 
    -webkit-border-radius: 0 !important; 
    -moz-border-radius: 0 !important; 
    border-radius: 0 !important;
} 

label { 
    font-weight: 400; 
    font-size: 14px;
} 

.point-value { 
    font-size: 20px; 
    font-weight: bold;
} 

input { 
    color: inherit; 
    margin: 0px 0 0 0;
} 

input { 
    line-height: normal;
} 

input { 
    font-family: inherit; 
    font-size: inherit; 
    line-height: inherit;
} 

input { 
    -webkit-border-radius: 0 !important; 
    -moz-border-radius: 0 !important; 
    border-radius: 0 !important;
} 

.voucher-code-input { 
    width: 100%; 
    height: 40px; 
    background: transparent; 
    border: 1px solid rgb(149, 149,149); 
    border-radius: 2px; 
    opacity: 0.6;
} 

.point-note { 
    font-family: SourceSansPro-Italic; 
    font-size: 16px; 
    width: 100%; 
    float: left; 
    color: rgb(73, 76,98); 
    margin-top: 5px; 
    margin-bottom: 10px;
} 

.point-money { 
    font-size: 20px; 
    font-weight: bold;
} 

button { 
    color: inherit; 
    margin: 0px 0 0 0;
} 

button { 
    overflow: visible;
} 

button { 
    text-transform: none;
} 

button { 
    -webkit-appearance: button; 
    cursor: pointer;
} 

button { 
    font-family: inherit; 
    font-size: inherit; 
    line-height: inherit;
} 

button { 
    -webkit-border-radius: 0 !important; 
    -moz-border-radius: 0 !important; 
    border-radius: 0 !important;
} 

.btn { 
    display: inline-block; 
    margin-bottom: 0; 
    font-weight: normal; 
    text-align: center; 
    vertical-align: middle; 
    -ms-touch-action: manipulation; 
    touch-action: manipulation; 
    cursor: pointer; 
    background-image: none; 
    border: 1px solid transparent; 
    white-space: nowrap; 
    padding: 6px 12px; 
    font-size: 14px; 
    line-height: 1.42857143; 
    border-radius: 4px; 
    -webkit-user-select: none; 
    -moz-user-select: none; 
    -ms-user-select: none; 
    user-select: none;
} 

.btn { 
    border-width: 0; 
    padding: 5px 14px; 
    font-size: 14px; 
    outline: none !important; 
    background-image: none !important; 
    filter: none; 
    -webkit-box-shadow: none; 
    -moz-box-shadow: none; 
    box-shadow: none; 
    text-shadow: none;
} 

.btn { 
    text-transform: uppercase;
} 

.btn { 
    flex: 1 1 auto; 
    text-align: center; 
    transition: 0.5s; 
    background-size: 200% auto; 
    color: white; 
    border-radius: 10px;
} 

.btn-3 { 
    background-image: linear-gradient(to right, #fc3606 0%, #fda085 51%, #fc7704 100%) !important;
} 

.btn-mua-ve { 
    padding: 10px 40px; 
    position: relative; 
    border-radius: 4px !important;
} 

.btn:hover { 
    color: #333; 
    text-decoration: none;
} 

.btn:hover,.btn:active { 
    filter: none; 
    text-shadow: none; 
    -webkit-box-shadow: none; 
    -moz-box-shadow: none; 
    box-shadow: none;
} 

.btn:hover { 
    background-position: right center;
} 

.btn-3,.btn-3:hover { 
    background-image: linear-gradient(to right, #fc3606 0%, #fda085 51%, #fc7704 100%) !important;
} 


/* These were inline style tags. Uses id+class to override almost everything */
#style-eZhop.style-eZhop {  
   font-style: italic;  
    color: #1473B6;  
}  
#style-7xlKo.style-7xlKo {  
   width: 100%;  
}  

</style>
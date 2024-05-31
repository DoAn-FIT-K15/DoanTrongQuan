<template>
    <Global>
  <div>
    <UModal v-model="isOpen" prevent-close>
      <div class="p-3">
        <div class="flex justify-end">
            <UButton color="gray" variant="ghost" icon="i-heroicons-x-mark-20-solid" class="-my-1" @click="isOpen = false" />
        </div>
        <div class="text-center">
            <h2>Xác nhận thanh toán</h2>
        </div>
        <div class = "flex flex-col">
            <div v-for="(item, i) in infoBill" :key="i" class="grid sm:grid-cols-3 py-2 items-center justify-center">
                <div class="col-span-1 font-bold text-sm">
                    {{ item }}
                </div>
                <div class="col-span-2">
                    <div v-if="item === 'Phim'">
                        <span>{{ movie.movieName }}</span>  
                    </div>
                    <div v-else-if="item === 'Rạp'">
                        <span>{{ nameOfCinema }}</span>
                    </div>
                    <div v-else-if = "item === 'Phòng chiếu'">
                        <span>{{ movie.romName }}</span>
                    </div>
                    <div v-else-if = "item === 'Thời gian'">
                        <span>{{ movie.day }} {{ movie.startAt}}</span>
                    </div>
                    <div v-else-if = "item === 'Ghế'">
                        <span v-for="(seat, k) in seatSelected" :key="k" class ="mr-2">
                            {{ seat }}
                        </span>
                    </div>
                    <div v-else-if = "item === 'Đồ ăn'">
                        <div v-for="(food, i) in foodSelected" :key="i">
                            <div v-if="food.count > 0"> 
                               {{ food.count }} x {{ food.name }} 
                            </div>
                        </div>
                    </div>
                    <div v-else-if = "item === 'Tổng tiền'">
                        <span>{{ finalAmount === 0 ? totalMoney : finalAmount }} vnđ</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="flex justify-center w-full ">
            <button @click = "confirmPayment" class = "rounded-md bg-orange-500 p-1 text-white">
                XÁC NHẬN
            </button>
        </div>
      </div>

    </UModal>
  </div>
  <div style="background-color: #f8f8f8;">
    <div class="container" style="width: 81%;padding-top: 10px;">
    <div class="row">
      <div v-if="!isShowFood" class="col-lg-8 col-md-12" style="">
        <h3 style="font-size: 23px;
            line-height: 1.5em;
            color: black;
            font-weight: 600;
            font-family: sans-serif;
            margin-top: 20px;
            margin-bottom: 20px;
            ">Trang chủ >
            <span>Đặt vé </span> 
            <span>{{ movieDetail.name }}</span></h3>
          <div class="text-center" :style="{ backgroundColor: currentColor }" 
            style="color: red;padding: 10px;
            font-weight: 600;
            font-size: 14px;
            margin-bottom: 15px;">
            Theo quy định của cục điện ảnh, phim này không dành cho khán giả dưới 18 tuổi
          </div>
          <div class="row">
            <div class="col-lg-3" v-for="(note,i) in note_seat_status" :key="i"
            style="display: flex;align-items: center;"
            >
                <img :src="note.linkImage" alt="" style="width: 35px; height: 35px;">
                <span style="font-weight: 600;margin-left: 8px;">{{ note.text }}</span>
            </div>
          </div>
          <div class="room-over-view" style="margin-top: 20px;">
            <div class="row">
                <div class="seat-diagram">
                    <div class="screenImage">
                     <img  src="/img/ic-screen.png" alt="" style="width: 100% !important;">

                    </div>
                    <div class="check-show" style="margin-top: 20px;">
                        <!-- <div class="full-width" style="">
                            <div class="seat" v-for="(seat, i) in seats.slice(0, 18)" :key="i" style="text-align: center;">
                                <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                            </div>
                        </div>
                        <div class="full-width">
                            <div class="seat" v-for="(seat, i) in seats.slice(18, 36)" :key="i" style="text-align: center;">
                                <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                            </div>
                        </div>
                        <div class="full-width">
                            <div class="seat" v-for="(seat, i) in seats.slice(36, 54)" :key="i" style="text-align: center;">
                                <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                            </div>
                        </div> -->
                        <div class="full-width" style="">
                            <div class="seat-normal" v-for="(seat, i) in seats.slice(0, 18)" :key="i" @click="bookingSeat(seat)" style="cursor: pointer;">
                              <div v-if ="seat.seatStatus === 4" style="text-align: center; background-image: url('/img/seat-buy-normal.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;">
                                <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                              </div>
                              <div v-else-if="seat.seatStatus === 3 && seat.userId === userID" style="text-align: center; background-image: url('/img/seat-select-normal.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;">
                                <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                              </div>
                              <div v-else-if="seat.seatStatus === 3" style="text-align: center; background-image: url('/img/seat-process-normal.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;">
                                <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                              </div>
                              <div v-else-if="seat.seatStatus === 1 && seat.seatType == 1" class="seat" style="text-align: center; background-image: url('/img/seat-unselect-normal.png');">
                                <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                              </div>
                            </div>
                        </div>
                        <div class="full-width" style="">
                            <div class="seat-normal" v-for="(seat, i) in seats.slice(18, 36)" :key="i" @click="bookingSeat(seat)" style="cursor: pointer;">
                              <div v-if ="seat.seatStatus === 4" style="text-align: center; background-image: url('/img/seat-buy-normal.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;">
                                <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                              </div>
                              <div v-else-if="seat.seatStatus === 3 && seat.userId === userID" style="text-align: center; background-image: url('/img/seat-select-normal.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;">
                                <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                              </div>
                              <div v-else-if="seat.seatStatus === 3" style="text-align: center; background-image: url('/img/seat-process-normal.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;">
                                <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                              </div>
                              <div v-else-if="seat.seatStatus === 1 && seat.seatType == 1" class="seat" style="text-align: center; background-image: url('/img/seat-unselect-normal.png');">
                                <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                              </div>
                            </div>
                        </div>
                        <div class="full-width" style="">
                            <div class="seat-normal" v-for="(seat, i) in seats.slice(36, 54)" :key="i" @click="bookingSeat(seat)" style="cursor: pointer;">
                              <div v-if ="seat.seatStatus === 4" style="text-align: center; background-image: url('/img/seat-buy-normal.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;">
                                <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                              </div>
                              <div v-else-if="seat.seatStatus === 3 && seat.userId === userID" style="text-align: center; background-image: url('/img/seat-select-normal.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;">
                                <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                              </div>
                              <div v-else-if="seat.seatStatus === 3" style="text-align: center; background-image: url('/img/seat-process-normal.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;">
                                <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                              </div>
                              <div v-else-if="seat.seatStatus === 1 && seat.seatType == 1" class="seat" style="text-align: center; background-image: url('/img/seat-unselect-normal.png');">
                                <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                              </div>
                            </div>
                        </div>
                        <div class="full-width" style="">
                            <div class="seat-normal" v-for="(seat, i) in seats.slice(54, 72)" :key="i" @click="bookingSeat(seat)" style="cursor: pointer;">
                              <div v-if ="seat.seatStatus === 4" style="text-align: center; background-image: url('/img/seat-buy-normal.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;">
                                <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                              </div>
                              <div v-else-if="seat.seatStatus === 3 && seat.userId === userID" style="text-align: center; background-image: url('/img/seat-select-normal.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;">
                                <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                              </div>
                              <div v-else-if="seat.seatStatus === 3" style="text-align: center; background-image: url('/img/seat-process-normal.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;">
                                <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                              </div>
                              <div v-else-if="seat.seatStatus === 1 && seat.seatType == 1" class="seat" style="text-align: center; background-image: url('/img/seat-unselect-normal.png');">
                                <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                              </div>
                            </div>
                        </div>
                        <div class="full-width">
                            <div class="seat-vip" v-for="(seat, i) in seats.slice(72, 90)" :key="i"  @click="bookingSeat(seat)" style="cursor: pointer;">                
                                <div v-if ="seat.seatStatus == 3 && seat.userId === userID" style="text-align: center; background-image: url('/img/seat-select-vip.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;" >
                                    <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                                </div>
                                <div v-else-if ="seat.seatStatus == 4" style="text-align: center; background-image: url('/img/seat-buy-vip.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;">
                                    <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                                </div>
                                <div v-else-if="seat.seatStatus === 3" style = "text-align: center; background-image: url('/img/seat-process-vip.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;">
                                    <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                                </div>
                                <div  v-else-if="seat.seatType === 2 && seat.seatStatus == 1" style="text-align: center; background-image: url('/img/seat-unselect-vip.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;">
                                    <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                                </div>
                            </div>
                        </div>
                        <div class="full-width">
                            <div class="seat-vip" v-for="(seat, i) in seats.slice(90, 106)" :key="i"  @click="bookingSeat(seat)" style="cursor: pointer;">                
                                <div v-if ="seat.seatStatus == 3 && seat.userId === userID" style="text-align: center; background-image: url('/img/seat-select-vip.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;" >
                                    <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                                </div>
                                <div v-else-if ="seat.seatStatus == 4" style="text-align: center; background-image: url('/img/seat-buy-vip.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;">
                                    <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                                </div>
                                <div v-else-if="seat.seatStatus === 3" style = "text-align: center; background-image: url('/img/seat-process-vip.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;">
                                    <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                                </div>
                                <div  v-else-if="seat.seatType === 2 && seat.seatStatus == 1" style="text-align: center; background-image: url('/img/seat-unselect-vip.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;">
                                    <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                                </div>
                            </div>
                        </div>
                        <div class="full-width">
                            <div class="seat-vip" v-for="(seat, i) in seats.slice(106, 120)" :key="i"  @click="bookingSeat(seat)" style="cursor: pointer;">                
                                <div v-if ="seat.seatStatus == 3 && seat.userId === userID" style="text-align: center; background-image: url('/img/seat-select-vip.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;" >
                                    <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                                </div>
                                <div v-else-if ="seat.seatStatus == 4" style="text-align: center; background-image: url('/img/seat-buy-vip.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;">
                                    <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                                </div>
                                <div v-else-if="seat.seatStatus === 3" style = "text-align: center; background-image: url('/img/seat-process-vip.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;">
                                    <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                                </div>
                                <div  v-else-if="seat.seatType === 2 && seat.seatStatus == 1" style="text-align: center; background-image: url('/img/seat-unselect-vip.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;">
                                    <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                                </div>
                            </div>
                        </div>
                        <div class="full-width">
                            <div class="seat-vip" v-for="(seat, i) in seats.slice(120, 134)" :key="i"  @click="bookingSeat(seat)" style="cursor: pointer;">                
                                <div v-if ="seat.seatStatus == 3 && seat.userId === userID" style="text-align: center; background-image: url('/img/seat-select-vip.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;" >
                                    <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                                </div>
                                <div v-else-if ="seat.seatStatus == 4" style="text-align: center; background-image: url('/img/seat-buy-vip.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;">
                                    <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                                </div>
                                <div v-else-if="seat.seatStatus === 3" style = "text-align: center; background-image: url('/img/seat-process-vip.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;color: white;">
                                    <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                                </div>
                                <div  v-else-if="seat.seatType === 2 && seat.seatStatus == 1" style="text-align: center; background-image: url('/img/seat-unselect-vip.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;">
                                    <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                                </div>
                            </div>
                        </div>

                        <!-- <div class="full-width">
                            <div class="seat-vip"  v-for="(seat, i) in seats.slice(90, 107)" :key="i">
                                <div class="seat"  v-if="seat.seatType === 2" style="text-align: center; background-image: url('https://www.betacinemas.vn/Assets/global/img/booking/seat-unselect-vip.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;">
                                    <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                                </div>
                            </div>
                        </div>
                        <div class="full-width">
                            <div class="seat-vip" v-for="(seat, i) in seats.slice(107, 123)" :key="i">
                                <div class="seat"  v-if="seat.seatType === 2" style="text-align: center; background-image: url('https://www.betacinemas.vn/Assets/global/img/booking/seat-unselect-vip.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;">
                                    <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                                </div>
                            </div>
                        </div>
                        <div class="full-width">
                            <div class="seat-vip"  v-for="(seat, i) in seats.slice(123, 138)" :key="i">
                                <div class="seat"  v-if="seat.seatType === 2" style="text-align: center; background-image: url('https://www.betacinemas.vn/Assets/global/img/booking/seat-unselect-vip.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;">
                                    <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                                </div>
                            </div>
                        </div>
                        <div class="full-width">
                            <div class="seat-vip" v-for="(seat, i) in seats.slice(138, 153)" :key="i">
                                <div class="seat"  v-if="seat.seatType === 2" style="text-align: center; background-image: url('https://www.betacinemas.vn/Assets/global/img/booking/seat-unselect-vip.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;">
                                    <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                                </div>
                            </div>
                        </div>
                        <div class="full-width">
                            <div class="seat-vip"  v-for="(seat, i) in seats.slice(153, 171)" :key="i">
                                <div class="seat"  v-if="seat.seatType === 2" style="text-align: center; background-image: url('https://www.betacinemas.vn/Assets/global/img/booking/seat-unselect-vip.png'); background-repeat: no-repeat; background-size: 35px 35px; background-position: center; width: 40px; height: 40px; display: inline-block; font-size: 11px; align-items: center; justify-content: center; margin-right: 8px;">
                                    <span style="margin: auto !important; line-height: 3;">{{ seat.seatLine }}{{ seat.seatNumber }}</span>
                                </div>
                            </div>
                        </div> -->
                    </div>
                </div>
            </div>              
          </div>
          <div class="seat-type-panel py-4" style="padding-top: 15px;width: 99%;border-radius: 10px;">
            <div class="row pl-6">
                <div class="col-lg-3 col-12" style="padding-top: 0;padding-bottom: 8px;">
                    <div class="row seat-type">
                        <div class="col-lg-3 col-4" style="padding: 0 !important;display: flex;align-items: center;">
                            <img  style="width: 40px;height: 40px;" src="/img/seat-unselect-normal-intro.png" alt="">
                        </div>
                        <span class="col-lg-8 col-4" style="font-size: 18px;margin-left: 8px;font-weight: bold;">Ghế thường</span>
                        
                        <span v-if = "seatNormal.seatSelectedCount != 0" class="col-12 value-money pl-0" style="padding-top:10px ;padding-bottom: 0;text-align: center;">{{ seatNormal.seatSelectedCount }} x {{ seatNormal.price }} vnđ</span>
                    </div>
                </div>
                <div class="col-lg-2 col-12" style="padding-top: 0;padding-bottom: 0;">
                    <div class="row seat-type">
                        <div class="col-lg-3 col-4" style="padding: 0 !important;display: flex;align-items: center;">
                            <img  style="width: 40px;height: 40px" src="/img/seat-unselect-vip.png" alt="">
                        </div>
                        <span class="col-lg-8 col-4" style="font-size: 18px;margin-left: 8px;font-weight: bold">Ghế VIP</span>
                        <span v-show ="seatVip.seatSelectedCount != 0" class="co-12 value-money pl-0" style="padding-top:10px ;padding-bottom: 0;text-align: center;">{{ seatVip.seatSelectedCount }} x {{ seatVip.price }} vnđ</span>
                    </div>
                </div>
                <div class="col-lg-2 col-12 lg:border-r-[2px]" style="padding-top: 0;padding-bottom: 8px;">
                    <div class="row seat-type">
                        <div class="col-lg-3 col-4" style="padding: 0 !important;display: flex;align-items: center;">
                            <img class="image-seat-double" style="width: 40px;height: 20px" src="/img/seat-unselect-double.png" alt="">
                        </div>
                        <span class="col-lg-8 col-4" style="font-size: 18px;margin-left: 8px;font-weight: bold">Ghế đôi</span>
                        <span v-show ="seatDouble.seatSelectedCount != 0" class="col-12 value-money pl-0" style="padding-top:10px ;padding-bottom: 0;text-align: center;">{{ seatDouble.seatSelectedCount }} x {{ seatDouble.price }} vnđ</span>
                    </div>
                </div>
                <div class="col-lg-3 col-12 money lg:border-r-[2px]" style="padding-top: 0;padding-bottom: 8px;">
                    <div class="flex flex-col" style="margin-top: 10px;">
                        <p class="" style="margin-bottom: 8px;font-size: 18px;margin-left: 8px;font-weight: bold;float: left;padding-left:0 ;padding-top: 5px;">Tổng tiền</p>
                        <p></p>
                        <p v-show ="totalMoney != 0" class="col-12result-money text-[#03599d] mb-0 text-end w-full px-3" style="padding-top:0;padding-bottom: 0;text-align: center;">{{ totalMoney }} vnđ</p>

                    </div>
                </div>
                <div id="time" class="col-lg-2 col-12" style="padding-top: 0;">
                    <h1>
                        {{ timeFormatted }}
                    </h1>
            </div>
            </div>
          </div>
      </div>
      <div v-else class="payment-form col-lg-8 col-md-12" style="margin-top: 30px;">
        <!-- <button @click = "check">check</button> -->
                            <div style="height: 35px;display: flex;">
                                <img src="https://www.betacinemas.vn/Assets/global/img/booking/ic-inforpayment.png" style="height: 100%;" alt="">
                                <div style="font-family: sans-serif;
                                font-size: 20px;
                                font-weight: 600;
                                line-height: 35px;
                                height: 35px;
                                float: left;
                                margin-left: 12px;
                                color: #494c62;">THÔNG TIN THANH TOÁN</div>
                            </div>
                            <div class="row">
                                <div class="col-4" style="font-size: 16px;">
                                    <span><b>Họ tên:</b></span>
                                    <br>
                                    <span> {{userName}} </span>
                                </div>
                                <div class="col-4" style="font-size: 16px;">
                                    <span><b>Số điện thoại:</b></span>
                                    <br>
                                    <span>{{ phoneNumber }}</span>
                                </div>
                                <div class="col-4" style="font-size: 16px;">
                                    <span><b>Email:</b></span>
                                    <br>
                                    <span>{{ email }}</span>
                                </div>  
                            </div>
                            <div  style="height: 35px;display: flex;margin-top: 20px;">
                                <img style="height: 100%;float: left;" src="https://www.betacinemas.vn/Assets/global/img/booking/ic-combo.png" alt="">
                                <div style="font-size: 20px;
                                font-weight: 700;
                                line-height: 35px;
                                height: 35px;
                                float: left;
                                margin-left: 12px;
                                color: #494c62;">COMBO ƯU ĐÃI</div>
                            </div>
                            <div style="margin-top: 30px;">
                                <v-card flat>
                                    <v-card-title class="d-flex align-center pe-2">
                                    <v-spacer></v-spacer>
                                    <v-text-field
                                        v-model="search"
                                        density="compact"
                                        label="Search"
                                        prepend-inner-icon="mdi-magnify"
                                        variant="solo-filled"
                                        flat
                                        hide-details
                                        single-line
                                    ></v-text-field>
                                    </v-card-title>

                                    <v-divider></v-divider>
                                    <v-data-table v-model:search="search" :items="foods" hover :headers="headersFood">
                                        <template v-slot:item.action = "{ item }">
                                            <div style="height: 150px; display: flex;align-items: center;">
                                                <span>{{ getQuantity(item.id) }}</span>
                                                <v-icon size="large" color="#03599d" class="me-2" @click = "foodPlus(item)">
                                                mdi-plus-box
                                                </v-icon>
                                                <v-icon size="large" color="#03599d" @click = "foodMinus(item)">
                                                mdi-minus-box
                                                </v-icon>
                                            </div>
                                        </template>
                                        <template v-slot:item.foodName="{ item }">
                                            <div style="font-family: sans-serif;
                                            font-weight: 600;">
                                                {{ item.foodName }}
                                            </div>
                                        </template>
                                        <template v-slot:item.price="{ item }">
                                            <div style="font-family: sans-serif;
                                            font-weight: 550;">
                                                {{ item.price }}
                                            </div>
                                        </template>
                                        <template v-slot:item.image="{ item }">
                                            <v-card style="width: 130px;height: 130px;" class="my-2" rounded>
                                            <v-img
                                                style="width: 100%;height: 100%;"
                                                :src="item.image"
                                                height="64"
                                                cover
                                            ></v-img>
                                            </v-card>
                                        </template>
                                    </v-data-table>
                                </v-card>
                            </div>
                            <div class = "flex justify-end my-4">
                                <span class = "font-bold text-xl">{{ timeFormatted }}</span>
                            </div>
                            <div  style="margin-top: 35px;display:  flex;">
                                <div style="width: 56px;height: 35px;">
                                    <img src="https://www.betacinemas.vn/Assets/global/img/booking/ic-payment.png" style="width: 100%;height: 100%;" alt="">
                                </div>
                                <div
                                style="font-size: 20px;
                                font-weight: 500;
                                line-height: 35px;
                                height: 35px;
                                float: left;
                                margin-left: 12px;
                                color: #494c62">
                                    GIẢM GIÁ
                                </div>
                            </div>
                            <div style="display: flex;margin-top: 20px;align-items: center;
                                font-size: 15px;border-bottom: 1px solid #ccc;padding-bottom: 10px;">
                                <font-awesome-icon :icon="['fas', 'circle-arrow-right']" style="font-size: 14px;" />
                                <b style="margin-left: 5px;">Voucher</b>
                                <span @click="showListVoucher" style="color: #1473B6;cursor: pointer;margin-left: 5px;">( Nhấn vào đây để xem danh sách voucher của bạn )</span>
                            </div>
                            <div v-if="isShowVoucher">
                                <div style="display: flex;margin-top: 20px;">
                                    <input class="col-4" type="text" v-model="voucherInput" name = "Voucher" placeholder="Voucher"
                                    style="border: 1px solid rgb(149, 149,149);border-radius: 5px;height: 40px;">
                                    <button class="col-2" 
                                    @click="getDiscountAmount"
                                    style="text-align: left;display: flex;
                                    align-items: center;height: 40px;
                                    color: white;                      
                                    font-weight: bold;
                                    margin-left: 15px;
                                    justify-content: center;
                                    background-image: linear-gradient(to right, #fc3606 0%, #fda085 51%, #fc7704 100%) !important;
                                    ">ÁP DỤNG
                                    </button>
                                </div>
                                <div style="font-size: 20px;
                                color: rgb(73, 76, 98);
                                margin-top: 14px;
                                margin-bottom: 8px;
                                font-weight: bold;
                                float: left;
                                width: 100%">
                                VOUCHER CỦA BẠN
                                </div>
                                <div class="voucher" style="margin-top: 60px;">
                                    <v-card flat> 
                                    <v-data-table
                                        style="font-weight: 600;font-size: 18px;"
                                        :headers="headersPromotion"
                                        :items="promotions"
                                        :search="search2" >
                                        <template #bottom></template>
                                    </v-data-table>
                                </v-card> 
                                </div>
                            </div>
                            <div>
                              <Point/>  
                            </div>

                            <div style="text-align: right;margin-top: 20px;font-size: 18px;">
                                <span style="margin-bottom: 10px"><b>Tổng tiền: </b>{{ totalMoney }} vnđ</span>
                                <br>
                                <br>
                                <span style="margin-bottom: 10px"><b>Số tiền được giảm: </b>{{discountAmount}} vnđ</span>
                                <br>
                                <br>         
                                <span style="margin-bottom: 10px"><b>Số tiền cần thanh toán: </b>{{ finalAmount }} vnđ</span>
                            </div>
      </div>
      <div class="col-lg-4 d-lg-block d-md-none d-block info-schedule-1">
        <div class="content-schedule" style="background-color: white;border-radius: 10px;height: 100%;">
            <div class="row">
                <div class="col-6" style="padding-top: 0;">
                    <img :src="movie.img" alt="" style="width: 155px;height: 236px;border-radius: 10px;">
                </div>
                <div class="col-6" style="padding-top: 20px;">
                    <h3 style="font-size: 23px;color: #03599d;font-weight: 700;">{{ movie.movieName }}</h3>
                    <h5 style="font-weight: 300;">Phụ đề</h5>
                </div>
            </div> 
                <div class="row mt-4" style="padding-left: 35px;">
                    <div class="col-5" style="display: flex;align-items: center;padding-top: 0 !important;">
                        <font-awesome-icon :icon="['fas', 'tags']" style="font-size: 14px;color: black;" />
                        <p class = "mb-0" style="margin-left: 10px;">Thể loại</p>
                    </div>
                    <div class="col-7" style="float: left;padding-top: 0;display: flex;">
                        <p class = "mb-0" v-for = "(type,i) in movie.movieType" :key="i" 
                        style="margin-right: 5px;padding: 0.25rem;"><b >{{ type }}</b></p>
                    </div>
                </div>
                <div class="row mt-4" style="padding-left: 35px;">
                    <div class="col-5" style="display: flex;align-items: center;">
                        <font-awesome-icon :icon="['fas', 'clock']" style="font-size: 14px;color: black;" />
                        <p class = "mb-0" style="margin-left: 10px;">Thời lượng</p>
                    </div>
                    <div class="col-7" style="float: left;">
                        <p class = "mb-0"><b>{{ movie.duration}} phút</b></p>
                    </div>
                </div>
                <hr style="border-top: 2px dashed black ;">
                <div class="row mt-4"  style="padding-left: 35px;">
                    <div class="col-5" style="display: flex;align-items: center;">
                        <font-awesome-icon :icon="['fas', 'building-columns']" style="font-size: 14px;color: black;" />
                        <p class = "mb-0" style="margin-left: 10px;">Rạp chiếu</p>
                    </div>
                    <div class="col-7" style="float: left;">
                        <p class = "mb-0"><b>{{ nameOfCinema }}</b></p>
                    </div>
                </div>
                <div class="row mt-4"  style="padding-left: 35px;">
                    <div class="col-5" style="display: flex;align-items: center;">
                        <font-awesome-icon :icon="['fas', 'calendar-days']"  style="font-size: 14px;color: black;" />
                        <p class = "mb-0" style="margin-left: 10px;">Ngày chiếu</p>
                    </div>
                    <div class="col-7" style="float: left;">
                        <p class = "mb-0"><b>{{ movie.day }}</b></p>
                    </div>
                </div>
                <div class="row mt-4" style="padding-left: 35px;">
                    <div class="col-5" style="display: flex;align-items: center;">
                        <font-awesome-icon :icon="['fas', 'clock']" style="font-size: 14px;color: black;"/>
                        <p class = "mb-0" style="margin-left: 10px;">Giờ chiếu</p>
                    </div>
                    <div class="col-7" style="float: left;">
                        <p class = "mb-0"><b>{{ movie.startAt }}</b></p>
                    </div>
                </div>
                <div class="row mt-3"  style="padding-left: 35px;">
                    <div class="col-5" style="display: flex;align-items: center;">
                        <font-awesome-icon :icon="['fas', 'desktop']" style="font-size: 14px;color: black;" />
                        <p class = "mb-0" style="margin-left: 10px;">Phòng chiếu</p>
                    </div>
                    <div class="col-7" style="float: left;">
                        <p class = "mb-0"><b>{{ movie.romName }}</b></p>
                    </div>
                </div>
                <div class="row mt-4"  style="padding-left: 35px;">
                    <div class="col-5" style="display: flex;align-items: center;">
                        <font-awesome-icon :icon="['fas', 'cubes']" style="font-size: 14px;color: black;" />
                        <p class = "mb-0" style="margin-left: 10px;">Ghế ngồi</p>
                    </div>
                    <div class="col-7" style="float: left;">
                        <p class = "mb-0"><span v-for = "(seat,i) in seatSelected" :key ="i"
                            style="margin-right: 5px;"
                            >{{ seat }}</span></p>
                    </div>
                </div>
                <div class ="mt-4" style="display: flex;justify-content: center;margin-bottom: 20px;">
                        <button 
                        v-if ="!isShowFood"
                        @click="nextBookTicket"
                        style="width: 126px;height:41px;
                        background-image: linear-gradient(to right, #0a64a7 0%, #258dcf 51%, #3db1f3 100%) !important;
                        color: #fff;border-radius: 5px;">
                        TIẾP TỤC</button> 
                        <button 
                        v-else
                        @click="payment"
                        style="width: 126px;height:41px;
                        background:  #FF7614 ;
                        color: #fff;border-radius: 5px;">
                        THANH TOÁN</button> 
                </div>

        </div>
      </div>

          <div class="d-lg-none d-md-block d-none" style="border-radius: 10px;padding-right: 0;margin-top: 20px;display: flex !important;margin-bottom: 30px;padding-top: 10px;">
            <div class="row info-schedule-2 d-lg-none d-md-block d-none" style="background-color: white; border-radius: 10px;width: 100%;">
                <div class="col-6" style="padding-left: 0;padding-top: 0;">
                    <div class="image" style="width: 335px;height: 530px;">
                        <img style="width: 100%; height: 100%;border-radius: 10px;" :src="movie.img" alt="">
                    </div>
                </div>
                <div class="col-6" style="padding-top: 0;">
                    <h3 style="color:#03599d;margin-top: 10px;">{{ movie.movieName }}</h3>
                    <h4>Phụ đề</h4>
                    <div class="row" style="margin-top: 20px;padding-left: 35px;margin-bottom: 30px;">
                        <div class="col-md-5" style="display: flex;align-items: center;">
                            <font-awesome-icon :icon="['fas', 'tags']" style="font-size: 14px;color: black;" />
                            <p style="margin-left: 10px;">Thể loại</p>
                        </div>
                        <div class="col-md-7" style="float: left;">
                            <p v-for = "(type,i) in movie.movieType" :key="i"><b >{{ type }}</b></p>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;padding-left: 35px;margin-bottom: 30px;">
                        <div class="col-md-5" style="display: flex;align-items: center;">
                            <font-awesome-icon :icon="['fas', 'clock']" style="font-size: 14px;color: black;" />
                            <p style="margin-left: 10px;">Thời lượng</p>
                        </div>
                        <div class="col-md-7" style="float: left;">
                            <p><b>{{ movie.duration}} phút</b></p>
                        </div>
                    </div>
                    <hr style="border-top: 2px dashed black ;">
                    <div class="row"  style="margin-top: 20px;padding-left: 35px;margin-bottom: 30px;">
                        <div class="col-md-5" style="display: flex;align-items: center;">
                            <font-awesome-icon :icon="['fas', 'building-columns']" style="font-size: 14px;color: black;" />
                            <p style="margin-left: 10px;">Rạp chiếu</p>
                        </div>
                        <div class="col-md-7" style="float: left;">
                            <p><b>{{ nameOfCinema}}</b></p>
                        </div>
                    </div>
                    <div class="row"  style="margin-top: 20px;padding-left: 35px;margin-bottom: 30px;">
                        <div class="col-md-5" style="display: flex;align-items: center;">
                            <font-awesome-icon :icon="['fas', 'calendar-days']"  style="font-size: 14px;color: black;" />
                            <p style="margin-left: 10px;">Ngày chiếu</p>
                        </div>
                        <div class="col-md-7" style="float: left;">
                            <p><b>{{ movie.day }}</b></p>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;padding-left: 35px;margin-bottom: 30px;">
                        <div class="col-md-5" style="display: flex;align-items: center;">
                            <font-awesome-icon :icon="['fas', 'clock']" style="font-size: 14px;color: black;"/>
                            <p style="margin-left: 10px;">Giờ chiếu</p>
                        </div>
                        <div class="col-md-7" style="float: left;">
                            <p><b>{{ movie.startAt }}</b></p>
                        </div>
                    </div>
                    <div class="row"  style="margin-top: 20px;padding-left: 35px;margin-bottom: 30px;">
                        <div class="col-md-5" style="display: flex;align-items: center;">
                            <font-awesome-icon :icon="['fas', 'desktop']" style="font-size: 14px;color: black;" />
                            <p style="margin-left: 10px;">Phòng chiếu</p>
                        </div>
                        <div class="col-md-7" style="float: left;">
                            <p><b>{{ movie.romName }}</b></p>
                        </div>
                    </div>
                    <div class="row"  style="margin-top: 20px;padding-left: 35px;margin-bottom: 30px;">
                        <div class="col-md-5" style="display: flex;align-items: center;">
                            <font-awesome-icon :icon="['fas', 'cubes']" style="font-size: 14px;color: black;" />
                            <p style="margin-left: 10px;">Ghế ngồi</p>
                        </div>
                        <div class="col-md-7" style="float: left;">
                            <p><span>{{  }}</span></p>
                        </div>
                    </div>
                    <div style="display: flex;justify-content: center;margin-bottom: 20px;">
                            <button 
                            @click="nextBookTicket"
                            style="width: 126px;height:41px;
                            background-image: linear-gradient(to right, #0a64a7 0%, #258dcf 51%, #3db1f3 100%) !important;
                            color: #fff;border-radius: 5px;">
                            TIẾP TỤC</button>     
                    </div>
                </div>  
            </div>

          </div>
    </div>
  </div>
</div>
</Global>
</template>

<script setup>
import { useBooking } from '~/composables/booking/useBooking'
import { useBookingStore } from '~/stores/user/useBookingStore';
import { useSocket } from '~/composables/useSocket';
import { useProfile } from '~/composables/Profile/useProfile';
import User from '../management/user.vue';


definePageMeta({
  middleware:'auth', 
})
const route  = useRoute()
const router  = useRouter()
const isActive = ref(true)
const bookingStore = useBookingStore()
const { userID,userName,phoneNumber,email } = useProfile()

const isShowFood = ref(false)
const isOpen = ref(false)






const {
    nameOfCinema,
    movieDetail,
    note_seat_status,
    
} = useBooking()
      

const {
    stompClient,
    message,
    content,
    connect,
    disconnect,
    sendMessage
}  = useSocket()

const isShowVoucher = ref(false);
const showListVoucher = () => {
        isShowVoucher.value = !isShowVoucher.value;
}
const seats = computed(() => {
    return bookingStore.seats;
})
const seatNormal = computed(() => {
    return bookingStore.seatNormal;
})
const seatVip = computed(()=>{
    return bookingStore.seatVip;
})
const seatDouble = computed(()=> {
    return bookingStore.seatDouble;
})
const totalMoney = computed(() => {
    return bookingStore.totalMoney;
})
const movie = computed(() => {
    return bookingStore.movie;
});
const seatSelected = computed(() => {
    return bookingStore.seatSelected;
});

const foods = computed(() => {
    return bookingStore.foods;
});

const promotions = computed(() => {
    return bookingStore.promotions;
});

const finalAmount = computed(() => {
    return bookingStore.finalAmount === 0 ? bookingStore.totalMoney : bookingStore.finalAmount;
})
const discountAmount = computed(() => {
    return bookingStore.discountAmount;
})

const isSeatSelectedVip = Boolean(seatVip.value)
const isSeatSelectedNormal = Boolean(seatNormal.value)
const isSeatSelectedDouble = Boolean(seatDouble.value)




const currentColorIndex = ref(0);
const colors = ref(['rgb(254, 185, 82)', 'rgb(243, 230, 192)']);
const currentColor = ref(colors.value[currentColorIndex.value]);

const headersFood = ref([
          { title: 'Combo', key: 'image', align: 'center', },
          { title: 'Tên Combo', align: 'center',key: 'foodName',sortable: false,class: 'bold-title',},  
          { title: 'Mô tả', key: 'description',align: 'center', },
          { title: 'Giá (VNĐ)', key: 'price',align: 'center', },
          { title: 'Số lượng', key: 'action',align: 'center', }  
      ])

const headersPromotion = ref([
          { title: 'Mã Voucher', key: 'name', align: 'center', },
          { title: 'Nội Dung Voucher', align: 'center',key: 'description',sortable: false,class: 'bold-title',},  
          { title: 'Ngày hết hạn', key: 'endTime',align: 'center', }, 
])


const time = ref(600)

const timeFormatted = computed(() => {
  const minutes = Math.floor(time.value / 60); // Lấy số phút
  const seconds = time.value % 60; // Lấy số giây
  return `${minutes}:${seconds.toString().padStart(2, '0')}`; // Định dạng thời gian
});

const checkConnect = () => {  
}

const seatResult = ref({})

watch(()=>seatResult.value,(newValue, oldValue) => {
    console.log('watch result');
    bookingStore.updateLocalSeat(newValue)
    // bookingStore.getTotalMoney(userID.value)
})

watch(() => time.value, (newValue, oldValue) => {
    if(parseInt(newValue) === 599){
        bookingStore.resetSeatStatus(route.params.schedule)

    }
    if(parseInt(newValue) === 0 ) {
        bookingStore.resetSeatStatus(route.params.schedule)
        router.replace('/')
    }
})

const intervalTime = ref(null)
const intervalColor = ref(null)

onMounted(() => {

    

    //tao bill
    bookingStore.createBill()

        //mỗi khi khởi tạo sẽ call api lấy dữ liệu mới nhất
    bookingStore.getAllSeat(route.params.schedule);


    // lây thông tin movie
    bookingStore.getMovie(route.params.schedule)

    intervalTime.value  =  setInterval(() => {
        if(time.value > 0){
            time.value = time.value - 1
        }else{
            // bookingStore.resetSeatStatus(route.params.schedule)
            // router.replace('/home')
        }
        
    },1000)

    intervalColor.value =  setInterval(() => {
        currentColorIndex.value = (currentColorIndex.value + 1) % colors.value.length;
        currentColor.value = colors.value[currentColorIndex.value];
    }, 1000); 

    connect('http://localhost:8089/booking',`/topic/seatStatus/${route.params.schedule}`,seatResult) 
});

onBeforeUnmount(() => {
    //ngat ket noi socket
    disconnect()
    if (intervalTime.value) clearInterval(intervalTime.value)
    if (intervalColor.value) clearInterval(intervalColor.value)
})

const currentSeat = ref({
            seatId:0,
            userId: userID.value,
            status:0,
            schedule: +route.params.schedule,
            seatType:0
})

const bookingSeat = ( seat ) => {
    if ( seat.seatStatus === 3 && seat.userId === userID.value ){
        currentSeat.value =  { 
            seatId: seat.id, 
            status:1,
            schedule:currentSeat.value.schedule, 
            userId: currentSeat.value.userId ,
            seatType: seat.seatType 
        }
        
        bookingStore.updateSeatStatus(currentSeat.value)
        sendMessage("/app/booking",currentSeat.value)
    }
    // Xử lí khi seat trống 
    if (seat.seatStatus === 1){
        currentSeat.value =  { 
            seatId: seat.id, 
            status:3,
            schedule:currentSeat.value.schedule, 
            userId: currentSeat.value.userId,
            seatType: seat.seatType   
        }
        bookingStore.updateSeatStatus(currentSeat.value)
        sendMessage("/app/booking",currentSeat.value)        
    }
    // Nếu seat = 4 (đã bán ) hoặc seat = 3 ( đang được giữ ) thì return
    if (seat.seatStatus === 3 && seat.userId != userID.value) {
        alert('Ghế đang được giữ')
    }
    if(seat.seatStatus === 4){
        alert("Ghế đã được bán")
    }
}
const nextBookTicket = async() => {
    if(seatSelected.value === null || totalMoney.value === 0){
        alert('Chưa chọn ghế')
    }else{
        bookingStore.getAllFood()
        bookingStore.getAllPromotionByUser()
        isShowFood.value = true;
    }
}
const foodSelected = ref({
})

const quantityOfFood = ref({});
const foodPlus = (item) => {
    if (!quantityOfFood.value[item.id]) {
    quantityOfFood.value[item.id] = 1;
    foodSelected.value[item.id] = { count: 1, name: item.foodName };
  } else {
    quantityOfFood.value[item.id]++;
    foodSelected.value[item.id].count++;
  }
  
    const data = {
        foodId:item.id,
        chooseFood:1
    }
    bookingStore.chooseFood(data)
}

const foodMinus = (item) => {
    if (quantityOfFood.value[item.id] && quantityOfFood.value[item.id] > 0) {
    quantityOfFood.value[item.id]--;
    foodSelected.value[item.id].count--;

    if (foodSelected.value[item.id].count === 0) {
      delete foodSelected.value[item.id];
    }
        const data = {
        foodId:item.id,
        chooseFood:2
    }
    bookingStore.chooseFood(data)
  }

}

const getQuantity = (item) => {
  return quantityOfFood.value[item] || '';
};

const voucherInput = ref('')

const getDiscountAmount = () => {
        const data = {
            code:voucherInput.value,
            totalMoney:totalMoney.value
        }
        console.log(data)
        bookingStore.getDiscountAmount(data)
}

const infoBill = [
    "Phim","Rạp","Phòng chiếu","Thời gian","Ghế","Đồ ăn","Tổng tiền"
]

const check = () => {
    console.log( route.params.schedule)
}
const payment = () => {
    isOpen.value = true;
}

const  confirmPayment = () => {
    let amount = finalAmount.value === 0 ? totalMoney.value : finalAmount.value;
    let user = userID.value
    let schedule = route.params.schedule;
    bookingStore.submitOrder(amount, user,schedule)
}

const isShowPoint = ref(false);
const showPoint = () => {
    isShowPoint.value = !isShowPoint.value
}

</script>

<style scoped>
@media only screen and (min-width: 1300px) {
    .screenImage {
        width: 856px !important;
        height: 96px !important;
    }
    .show-seats{
        width: 70% !important;
    }

}
@media only screen and (max-width:992px) {
    .total-money{
        padding-top: 15px !important;
        text-align: start;
        margin-left: 0 !important;
    }
    .value-money{
        padding-top: 0 !important ;
        text-align: end !important;
    }
    .money .seat-type{
        border-top:1px solid #d8d8d8 ;
    }
    .result-money{
        padding-top: 15px !important;
    }

    .seat-type{
        text-align: center !important;
        padding-right: 20px !important;
    }
}
@media only screen and (min-width: 992px) and (max-width:1300px) {
    .screenImage {
        width: 856px !important;
        height: 96px !important;
    }
    .container {
        width: 93% !important;
    }

}
@media only screen and (min-width: 800px) and (max-width: 992px){
    .screenImage {
        width: 856px !important;
        height: 96px !important;
    }
    .title-info p {
        font-size: 12px !important;
    }
    .container{
        width: 90% !important;
    }
    .image-seat-double{
        width: 50px !important;
        height: 25px !important;
    }

@media only screen and (min-width: 768px) and (max-width: 992px){
    .info-schedule-2  {
        display: flex !important;
    }
    .result-money{
        margin-top: 0 !important;
    }
}
}
@media only screen and (min-width: 650px) and (max-width: 800px){
    .screenImage {
        width: 856px !important;
        height: 96px !important;
    }
    .container{
        width: 93% !important;
    }
        .result-money{
        margin-top: 0 !important;
    }
    .result-money{
        margin-top: 0 !important;
    }
}
/* @media only screen and (min-width: 650px) and (max-width: 768px){
    .infor-schedule-2 .col-6 .image {
        width: 280px !important;
        height: 480px !important;
    }
} */
@media only screen and (max-width: 650px){
    .screenImage {
        width: 856px !important;
        height: 96px !important;
    }
    .title-info p {
        font-size: 10px !important;
    } 
    .container {
        width: 95% !important;
    }
}
@media only screen and (max-width: 768px){
    .info-schedule-1 {
        margin-top: 20px;
    }
    .result-money{
        margin-top: 0 !important;
    }
}
.room-over-view > .row {
    overflow-x: auto;
    white-space: nowrap;
}

.seat-vip {
    display: inline-block;
}
.seat-normal {
    display: inline-block;
}
.seat{
    width: 40px;
    height: 40px;
    display: inline-block;
    font-size: 11px;
    align-items: center;
    justify-content: center;
    margin-right: 8px;
    /* background-image: url(https://betacinemas.vn/Assets/global/img/booking/seat-unselect-normal.png); */
    background-repeat: no-repeat ;
    background-size: 35px 35px ;
    background-position: center;
}
.seat-type-panel{
    margin-top: 40px;
    background-color: white;
}
.content-schedule{
    transition: tranform 0.2s ease;
}
.content-schedule:hover {
    transform: translateY(-1px);
}

.content-schedule {
    background-color: white;
    border-radius: 10px;
    height: 100%;
    position: -webkit-sticky; /* Đối với Safari */
    position: sticky;
    top: 0;
}


</style>
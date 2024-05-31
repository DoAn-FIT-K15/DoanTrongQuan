
import { defineStore } from "pinia";
import { getAllCinema } from '~/repositories/cinema/dataCinemasRepo';
import { useSyncCookieState } from '~/composables/useSyncCookieState';// import {useSyncSessionStorageState} from '~/composables/useSyncSessionStorageState';

export const useCinemaStore = defineStore({
  id: "cinemaStore",
  state: () => ({
    
    // lấy giá trị từ cookie nếu không có thì mặc định là 'Beta Mỹ đình'
    nameOfCinema:  useCookie('nameOfCinema').value || 'Space Mỹ Đình',

    cinemas: [
      { address: 'Hà Nội', children: [] },
      { address: 'TP.Hồ Chí Minh', children: [] },
      { address: 'Bắc Giang', children: [] },
      { address: 'Đồng Nai', children: [] },
      { address: 'Khánh Hòa', children: [] },
      { address: 'Thái Nguyên', children: [] },
      { address: 'Thanh Hóa', children: [] },
      { address: 'Bà Rịa-Vũng Tàu', children: [] },
      { address: 'Bình Dương', children: [] },
      { address: 'Kiên Giang', children: [] },
      { address: 'Lào Cai', children: [] }
    ]
  }),
  getters: {},
  actions: {
    async getAllCinemas  ()  {
      
      for (const cinema of this.cinemas) {
        try {
            const address = cinema.address;
            const res = await getAllCinema(address);
            cinema.children = res.data; 
        } catch (error) {

        }
    }
    },
    
    async setNameOfCinema (name) {
      const expirationDate = new Date();
      // hêt 5 phút sẽ xóa cookie dựa vào thuộc tính expires
      expirationDate.setTime(expirationDate.getTime() + (5 * 60 * 1000));

      useCookie('nameOfCinema').value = name
      this.nameOfCinema = name;
      console.log(this.nameOfCinema);
    },
  }
});

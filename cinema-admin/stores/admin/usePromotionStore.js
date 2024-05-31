import { defineStore } from "pinia";
import { getAllPromotion,createPromotion } from '~/repositories/cinema/promotionRepo';
import { createToast } from "~/utils/toast";

export const usePromotionStore = defineStore({
  id: "promotionStore",
  state: () => ({
    promotions:[],

  }),
  getters: {},
  actions: {
    async getAllPromotion(){
        try {
          const res = await getAllPromotion()
          this.promotions = res.data;

        } catch (error) {  
          throw error;
        }
    },

    async createPromotion(data){
      try {
        const res = await createPromotion(data);
        createToast({message:'Tạo mới sự kiện thành công',time:3000, title: 'Thành công'})
      } catch (error) {  
        createToast({message: error.response.data , type: 'error', title: 'Thất bại'})
      }
  },


    clear() {
      this.$reset()
    }
  }
});
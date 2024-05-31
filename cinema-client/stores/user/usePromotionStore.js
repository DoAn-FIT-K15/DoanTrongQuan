
import { defineStore } from "pinia";

import { createToast } from "~/utils/toast";
import { getAllPromotion,getPromotionDetail } from "~/repositories/cinema/promotionRepo";
import { useMovieStore } from "./useMovieStore";

export const usePromotionStore = defineStore({
  id: "promotionStore",
  state: () => ({
    isShowLoading: false,
    events:[],
    eventDetail:{}

  }),
  getters: {},
  actions: {
    async getAllPromotion() {
      try {
        useMovieStore().isShowLoading = true;
        const res = await getAllPromotion()
        this.events = res.data
      } catch (error) {
        
      }finally {
        useMovieStore().isShowLoading = false;
      }
    },
    async getPromotionDetail(id) {
      useMovieStore().isShowLoading = true;
      try {
        const res = await getPromotionDetail(id)
        this.eventDetail = res.data
      } catch (error) {
      }finally {
        useMovieStore().isShowLoading = false;
      }
    },

  }
});

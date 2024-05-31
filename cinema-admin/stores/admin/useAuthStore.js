import { defineStore } from "pinia";
import { getAllBill } from '~/repositories/cinema/billRepo';
import { createToast } from "~/utils/toast";
export const useBillStore = defineStore({
  id: "billStore",
  state: () => ({
    bills:[]
  }),
  getters: {},
  actions: {
    async getAllBill(){
        try {
          const res = await getAllBill()
          this.bills = res.data;

        } catch (error) {  
          console.log(error.response.data);
          throw error;
        }
    },


    clear() {
      this.$reset()
    }
  }
});
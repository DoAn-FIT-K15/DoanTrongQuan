
import { defineStore } from "pinia";
import { changePassword, getHistoryBillUser, getProfileUser } from "~/repositories/cinema/authRepo"


export const useAuthStore = defineStore({
  id: "authStore",
  state: () => ({
    historyBill:[],
    user:{}
  }),
  getters: {},
  actions: {
    async changePassword(data){
        try {
          const res = await changePassword(data)
        } catch (error) {  
        }
    },
    async getHistoryBillUser(){
      try {
        const res = await getHistoryBillUser()
        this.historyBill = res.data;
      } catch (error) {  

      }
  },
  async getProfileUser(){
    try {
      const res = await getProfileUser()
      this.user = res.data;
    } catch (error) {  

    }
},

  }
});

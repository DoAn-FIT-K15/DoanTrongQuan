import { defineStore } from "pinia";
import { getAllUser } from '~/repositories/cinema/userRepo';
import { confirmAuthor } from '~/repositories/cinema/authRepo'
import { createToast } from "~/utils/toast";
export const useUserStore = defineStore({
  id: "userStore",
  state: () => ({
    users:[],
  }),
  getters: {},
  actions: {
    async getAllUser(){
        try {
          const res = await getAllUser()
          this.users = res.data;
        } catch (error) {  
          alert(error.response.data)
        }
    },

    async confirmAuthor(data){
        try {
          const res = await confirmAuthor(data)
          this.users = res.data;
          alert("Nhượng quyền thành công")
        } catch (error) {  
          alert(error.response.data);
        }
    },
      clear() {
        this.$reset()
      }

  },
  


});
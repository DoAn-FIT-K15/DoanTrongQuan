import { defineStore } from "pinia";
import { createActor,getAllActor } from '~/repositories/cinema/actorRepo';
import { createToast } from "~/utils/toast";

export const useActorStore = defineStore({
  id: "actorStore",
  state: () => ({
    actorName:[]
  }),
  getters: {},
  actions: {
    async createActor(data){
        try {
          const res = await createActor(data)
          createToast({message:'Tạo mới diễn viên thành công',time:3000, title: 'Thành công'})
        } catch (error) {  
          createToast({message: error.response.data , type: 'error', title: 'Thất bại'})

        }
    },

    async getAllActor(){
      try {
        const res = await getAllActor()
        this.actorName = res.data;
      } catch (error) {  
        alert(error);
      }
  },

    clear() {
      this.$reset()
    }
  }
});
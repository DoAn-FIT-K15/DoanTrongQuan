import { defineStore } from "pinia";
import { createBlog } from '~/repositories/cinema/blogRepo';
import { createToast } from "~/utils/toast";
export const useBlogStore = defineStore({
  id: "blogStore",
  state: () => ({
    blogs:[]
  }),
  getters: {},
  actions: {
    async createBlog(data){
        try {
          const res = await createBlog(data)
          createToast({message:'Tạo mới blog thành cồng',time:3000, title: 'Thành công'})
        } catch (error) {  
          createToast({message: error.response.data , type: 'error', title: 'Thất bại'})
        }
    },


    clear() {
      this.$reset()
    }
  }
});
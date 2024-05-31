
import { defineStore } from "pinia";
import { getAllBlog, getBlogDetail } from '~/repositories/cinema/blogRepo';
import { useMovieStore, } from "./useMovieStore";



export const useBlogStore = defineStore({
  id: "blogStore",
  state: () => ({
    blogs:[],
    blogDetail:{}

  }),
  getters: {},
  actions: {
    async getAllBlog(){
        try {
          useMovieStore().isShowLoading = true;
          const res = await getAllBlog()
          this.blogs = res.data;
        } catch (error) {  

        }finally {
          useMovieStore().isShowLoading = false;
        }
    },
    async getBlogDetail(data){
      useMovieStore().isShowLoading = true;
      try {
        
        const res = await getBlogDetail(data)
        this.blogDetail = res.data;
      } catch (error) {  

      }finally {
        useMovieStore().isShowLoading = false;
      }
  },
  }
});

import { defineStore } from "pinia";
import { getAllMovie,createMovie,getMovieType,getAllCinemaName,getMovie,updateMovie,stopShowMovie } from '~/repositories/cinema/movieRepo';
import { createToast } from "~/utils/toast";
export const useMovieStore = defineStore({


  id: "movieStore",
  state: () => ({
    movies:[],
    movie:{},
    movieType:[],
    cinemaName:[],
  }),
  getters: {},
  actions: {
    async getAllMovie(){
        try {
          const res = await getAllMovie()
          this.movies = res.data;

        } catch (error) {  
          console.log(error.response.data);
          throw error;
        }
    },
    async createMovie(data){
      try {
        const res = await createMovie(data)
        createToast({message:'Tạo mới phim thành công',time:3000, title: 'Thành công'})
      } catch (error) { 
        createToast({message: error.response.data , type: 'error', title: 'Thất bại'})
      }
    },
    async updateMovie(data){
      try {
        const res = await updateMovie(data)
        this.movie = res.data;
        createToast({message:'Cập nhật phim thành công',time:3000, title: 'Thành công'})
      } catch (error) { 
        createToast({message: error.response.data , type: 'error', title: 'Thất bại'})
      }
    },
  async getMovie(data){
    try {
      const res = await getMovie(data)
      this.movie = res.data;
    } catch (error) { 
      console.log(error) 
      alert(error.response.data)
    }
},
  async getMovieType(){
    try {
      const res = await getMovieType()
      this.movieType = res.data;
    } catch (error) { 
      console.log(error) 
      alert(error.response.data)
    }
},
async getAllCinemaName(){
  try {
    const res = await getAllCinemaName()
    this.cinemaName = res.data;
  } catch (error) { 
    alert(error.response.data)
  }
},
async stopShowMovie(data){
  try {
    const res = await stopShowMovie(data)
    alert(res.data)
  } catch (error) { 
    alert(error.response.data)
  }
},

    clear() {
      this.$reset()
    }
  }
});
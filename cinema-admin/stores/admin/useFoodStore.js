import { defineStore } from "pinia";
import { createFood, getAllFood,getFoodByAdmin,updateFood } from '~/repositories/cinema/foodRepo'
import { createToast } from "~/utils/toast";
export const useFoodStore = defineStore({
    id: "foodStore",
    state: () => ({
        foods:[],
        foodDetail:{},
        isLoading:false,
    }),
    getters: {},
    actions: {
      async createFood(data){
          try {
            const res = await createFood(data)
            this.foods.push(res.data)
          } catch (error) {  
            alert(error.response.data)
          }
      },

      async getAllFood(){
        try {

          const res = await getAllFood()
          this.foods = res.data;

        } catch (error) {  
          alert(error.response.data)
        }

    },
    async getFoodByAdmin(data){
        console.log(data)
        try {
         this.isLoading = true;
          const res = await getFoodByAdmin(data);
          this.foodDetail = res.data;

        } catch (error) {  
          alert(error.response.data)
        }finally{
            this.isLoading = false
        }
    },
    async updateFood(data){
      try {
       this.isLoading = true;
        const res = await updateFood(data);
        for(let f of this.foods){
          if(f.id === res.data.id){
            f.price = res.data.price
            f.description = res.data.description
            f.image = res.data.image
            foo.foodName = res.data.foodName
            break;
          }
        }
        toast.add({ title: 'Cập nhật thành công' })
      } catch (error) {  
        alert(error.response.data)
      }finally{
          this.isLoading = false
      }
  },

      clear() {
        this.$reset()
      }
    }
  });
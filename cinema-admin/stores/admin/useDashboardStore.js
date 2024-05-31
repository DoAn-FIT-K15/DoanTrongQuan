import { defineStore } from "pinia";
import {getRevenueCinema } from '~/repositories/cinema/dashboardRepo';
import { createToast } from "~/utils/toast";

export const useDashboardStore = defineStore({
  id: "dashboardStore",
  state: () => ({
    chartData: {
      labels: [],
      datasets: [
        {
          label: 'Dữ liệu 1',
          backgroundColor: '#f87979',
          data: [],
        },
      ],
    }
  }),
  
  getters: {},
  actions: {
    async getRevenueCinema(){
        try {
          const res = await getRevenueCinema()
          this.chartData.labels = res.data.map(item => item.months);
          this.chartData.datasets[0].data = res.data.map(item => item.revenue);

        } catch (error) {  
          console.log(error.response.data);
        }
    },


    clear() {
      this.$reset()
    }
  }
});
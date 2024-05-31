<script setup>
import { Bar } from 'vue-chartjs';
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale,
} from 'chart.js';
import { useDashboardStore } from '~/stores/admin/useDashboardStore';

definePageMeta({
  middleware: 'auth',
})

const dashboardStore = useDashboardStore()
ChartJS.register(
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale
);
//lấy dữ liệu doanh thu cho cinema
dashboardStore.getRevenueCinema()

const chartData = computed(() => {
  return dashboardStore.chartData
})

const chartOptions = ref({
  responsive: true,
  maintainAspectRatio: false,
});

</script>

<template>
  <div class = "max-w-[1000px] max-h-[800px]">
    <Bar :data="chartData" :options="chartOptions" />
  </div>
</template>

// import { useCinemaStore } from "~/stores/user/useCinemaStore";
// import { useMovieStore } from "@/stores/user/useMovieStore.js";
// export default defineNuxtRouteMiddleware(async (to, from) => {
//   const router = useRouter();
//   const cinemaStore = useCinemaStore();
//   const movieStore = useMovieStore();

//   try {
//     await cinemaStore.getAllCinemas(); 
//     await movieStore.getAllMovieByCinema(cinemaStore.nameOfCinema)
//   } catch (error) {
//     console.error('Error fetching cinema data:', error);
//     router.replace('/error'); 
//   }
// });
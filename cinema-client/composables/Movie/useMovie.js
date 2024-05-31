// import { useCinemaStore } from "~/stores/user/useCinemaStore";
import { useMovieStore } from "@/stores/user/useMovieStore.js";

export const useMovie = () => {

  const movies = computed(() => {
    return useMovieStore().movies;
  })

  const isShowIconPlay = ref(Array(movies.length).fill(false));
  const isShowOverlay = ref(Array(movies.length).fill(false));

  const showIconPlayAndOverlay = (i, value) => {
    isShowIconPlay.value[i] = value;
    isShowOverlay.value[i] = value;
  }
  ;
  const isShowTrailer = ref(false);
  const currentMovieTrailer = ref('');

  const openDialogTrailer = (movieTrailer) => {
    isShowTrailer.value = true;
    currentMovieTrailer.value = movieTrailer;
  };
  return {
    movies,
    isShowIconPlay,
    isShowOverlay,
    showIconPlayAndOverlay,
    isShowTrailer,
    currentMovieTrailer,
    openDialogTrailer,

  }

}

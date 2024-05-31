import { getAllMovie } from '~/repositories/cinema/movieRepo';
import { useProfile } from '~/composables/useProfile';

export const useMovie = () => {
  const router = useRouter()
  const route = useRoute()
  const { role } = useProfile();

  const movies = ref([])

  async function getAllMovie(){
    try {
      const response = await getAllMovie();   
      movies.value = response
    } catch (error) {
      alert(error)
    }
  }

  return {
    movies,
    getAllMovie
  }
  
}
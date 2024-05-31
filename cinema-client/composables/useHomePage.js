
export const useHomePage = () => {
    const router = useRouter()

    const showMovieDetail = (event) => {
      event.preventDefault();
      const slug = event.data.slug;
      router.push(`/movie/${slug}`);
    }
    return {
      showMovieDetail,
    }
    
  }



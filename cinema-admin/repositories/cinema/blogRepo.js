import Cinema from '.'
const prefix = ''

export const createBlog = (data) => {
  const url = prefix + 'blog/create-blog'
  return Cinema.axiosAuth.post(url,data)
}



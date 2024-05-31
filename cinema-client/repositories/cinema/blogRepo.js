import Cinema from '.'
import axios from 'axios'

const prefix = ''
export const getAllBlog = () => {
  const url = prefix + 'blog/get-all-blog'
  return Cinema.axiosClient.get(url)
}

export const getBlogDetail = (blog) => {
  const url = prefix + 'blog/get-blog-detail?blogId='
  return Cinema.axiosAuth.get(url + blog)
}
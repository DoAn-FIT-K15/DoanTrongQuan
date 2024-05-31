import axios from 'axios'

class Cinema {
  axiosClient = axios
  axiosAuth = axios

  setAxiosClient = instance => {
    this.axiosClient = instance
  }

  setAxiosAuth = instance => {
    this.axiosAuth = instance
  }
}

export default new Cinema()

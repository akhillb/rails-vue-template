import axios from 'axios'
import qs from 'qs'

// create an axios instance
const service = axios.create({
  timeout: 300000,
  paramsSerializer: (params) => {
    return qs.stringify(params, {
      encode: false,
      arrayFormat: 'brackets'
    })
  },
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  }
})

export default service

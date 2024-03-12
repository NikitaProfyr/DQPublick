import axios from "axios";
import { ROUTES } from "../utils/routes"


// export const ApiUrl = 'http://localhost:8080'
export const ApiUrl = 'http://212.113.117.177/api'

let Api = null;

// axios.defaults.headers

const ApiWithOutToken = axios.create({
    // withCredentials: true,
    baseURL: ApiUrl,
})

const ApiWithToken = axios.create({
    withCredentials: true,
    baseURL: ApiUrl,
})

ApiWithToken.interceptors.request.use((config) => {
    config.headers.Authorization = localStorage.getItem('accessToken')
    return config
})


 
  

ApiWithToken.interceptors.response.use((config) => {
    return config
}, async (error) => {
    const originalRequest = error.config
    if(error.response.status === 401){
       try {
            const accessToken = await ApiWithToken.post('/users/refresh')
            .catch((err) => {
                if(err.response.status === 408){
                    try {
                        localStorage.removeItem('accessToken')
                        localStorage.removeItem('user')
                        ApiWithToken.post('/users/logout')
                        window.location.href = ROUTES.LOGIN
                    } catch (e) {
                        return Promise.reject(e);
                    } 
                }
            })
            localStorage.setItem('accessToken', accessToken.data.accessToken)
            return await ApiWithToken.request(originalRequest)
        } catch (e) {
            return Promise.reject(e);
        }
    }
})

if(localStorage.getItem('accessToken') === null){
    Api = ApiWithOutToken
}
else{
    Api = ApiWithToken
}

// Api.defaults.withCredentials = true
export default Api

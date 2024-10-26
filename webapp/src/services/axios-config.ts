import axios from 'axios'


export const api = axios.create({
  baseURL: 'https://back-8h8p.onrender.com/api/',
  timeout: 10000
})

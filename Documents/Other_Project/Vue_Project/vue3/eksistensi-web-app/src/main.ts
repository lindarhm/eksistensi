
import { createApp } from 'vue'
import axios from 'axios'

import App from './App.vue'
import router from './router'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.bundle.min.js'
import { createPinia } from 'pinia'

axios.defaults.baseURL = 'https://bidu.my.id/api/'

const app = createApp(App)

app.use(createPinia())
app.use(router)

app.mount('#app')

import './assets/main.css'

import Vue, { createApp } from '@vue/compat'
import { createPinia } from 'pinia'
import bootstrap from 'bootstrap'

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

import App from './App.vue'
import router from './router'

Vue.use(bootstrap)

const app = createApp(App)

app.use(createPinia())
app.use(router)

app.mount('#app')

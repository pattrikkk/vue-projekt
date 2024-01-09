import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import FestivalDetail from '../views/FestivalDetail.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/festivals/:id',
      name: 'FestivalDetail',
      component: FestivalDetail,
    }
  ]
})

export default router

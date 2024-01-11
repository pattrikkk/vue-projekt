import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '@/views/HomeView.vue'
import FestivalDetail from '@/views/FestivalDetail.vue'
import AllFestivals from '@/views/AllFestivals.vue'
import MusicianDetail from '@/views/MusicianDetail.vue'
import AllMusicians from '@/views/AllMusicians.vue'
import Contact from '@/views/Contact.vue'

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
    },
    {
      path: '/festivals',
      name: 'AllFestivals',
      component: AllFestivals,
    },
    {
      path: '/musicians/:id',
      name: 'MusicianDetail',
      component: MusicianDetail,
    },
    {
      path: '/musicians',
      name: 'AllMusicians',
      component: AllMusicians,
    },
    {
      path: '/contact',
      name: 'Contact',
      component: Contact,
    }
  ]
})

export default router

<template>
  <div class="container mt-4">
    <Carousel :carouselId="`carousel`" :slides="carouselSlides" />
    <section>
      <h2 class="mb-4">Happening right now</h2>
      <div class="row">
        <Card v-for="festival in happeningNowFestivals" :key="festival.id" :festival="festival" />
      </div>
    </section>
    <section>
      <h2 class="mb-4">Upcoming festivals</h2>
      <div class="row">
        <Card v-for="festival in upcomingFestivals" :key="festival.id" :festival="festival" />
      </div>
    </section>
  </div>
</template>

<script>
import { useFestivalStore } from '@/stores/festival';
import Card from '@/components/FestivalCard.vue';
import Carousel from '@/components/Carousel.vue';

export default {
  name: 'HomePage',
  components: {
    Card,
    Carousel,
  },
  data() {
    return {
      store: useFestivalStore(),
      carouselSlides: [
        { imageSrc: 'https://placehold.co/1000x300/png', altText: 'Placeholder 1', title: 'Discover Exciting Festivals', description: 'Explore a world of vibrant cultures and thrilling performances at our diverse festivals.' },
      ]
    };
  },
  mounted() {
    this.store.fetchFestivals();
  },
  computed: {
    happeningNowFestivals() {
      const now = new Date();
      return this.store.getFestivals().filter(festival => new Date(festival.date_from) <= now && new Date(festival.date_to) >= now).slice(0, 3);
    },
    upcomingFestivals() {
      const now = new Date();
      return this.store.getFestivals().filter(festival => new Date(festival.date_from) > now).slice(0, 3);
    },
  },
};
</script>

<style scoped></style>

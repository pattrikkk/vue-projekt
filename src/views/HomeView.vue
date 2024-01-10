<template>
  <div class="container mt-4">
    <div class="jumbotron">
      <h2 class="display-4">Discover the Magic of Festivals</h2>
      <p class="lead">Immerse yourself in a world of vibrant cultures, live music, and unforgettable experiences.</p>
    </div>
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

export default {
  name: 'HomePage',
  components: {
    Card,
  },
  data() {
    return {
      store: useFestivalStore(),
    };
  },
  mounted() {
    this.store.fetchFestivals();
  },
  computed: {
    happeningNowFestivals() {
      const now = new Date();
      return this.store.getFestivals().filter(festival => new Date(festival.date_from) <= now && new Date(festival.date_to) >= now);
    },
    upcomingFestivals() {
      const now = new Date();
      return this.store.getFestivals().filter(festival => new Date(festival.date_from) > now);
    },
  },
};
</script>

<style scoped></style>

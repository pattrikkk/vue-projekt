<template>
    <div class="container mt-4">
      <section>
        <h2 class="mb-4">All festivals</h2>
        <div class="row">
          <Card v-for="festival in allFestivals" :key="festival.id" :festival="festival" />
        </div>
      </section>
    </div>
  </template>
  
  <script>
  import { useFestivalStore } from '@/stores/festival';
  import Card from '@/components/FestivalCard.vue';
  
  export default {
    name: 'AllFestivals',
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
      allFestivals() {
        const now = new Date();
        return this.store.getFestivals()
      },
    },
  };
  </script>
  
  <style scoped></style>
  
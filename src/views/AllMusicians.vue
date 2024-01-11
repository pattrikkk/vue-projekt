<template>
    <div class="container mt-4">
      <section>
        <h2 class="mb-4">All musicians</h2>
        <div class="row">
          <Card v-for="musician in allMusicians" :key="musician.id" :musician="musician" />
        </div>
      </section>
    </div>
  </template>
  
  <script>
  import { useMusicianStore } from '@/stores/musician';
  import Card from '@/components/MusicianCard.vue';
  
  export default {
    name: 'allMusicians',
    components: {
      Card,
    },
    data() {
      return {
        store: useMusicianStore(),
      };
    },
    mounted() {
      this.store.fetchMusicians();
    },
    computed: {
      allMusicians() {
        const now = new Date();
        return this.store.getMusicians()
      },
    },
  };
  </script>
  
  <style scoped></style>
  
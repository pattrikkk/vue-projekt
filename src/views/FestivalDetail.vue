<template>
  <div v-if="festival">
    <h2>{{ festival.name }}</h2>
    <p><strong>Date:</strong> {{ festival.date }}</p>
    <p><strong>Location:</strong> {{ festival.location }}</p>
  </div>
  <div v-else>
    <p>Načítavam...</p>
  </div>
</template>
  
<script>
import { useFestivalStore } from '@/stores/festival';
export default {
  name: 'FestivalDetail',
  data() {
    return {
      store: useFestivalStore(),
    };
  },
  mounted() {
    this.store.fetchFestivals()
  },
  computed: {
    festival() {
      return this.store.getFestivalById(this.$route.params.id);
    },
  },
};
</script>
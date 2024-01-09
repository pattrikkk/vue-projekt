<template>
  <div>
    <div class="container mt-4">
      <div class="jumbotron">
        <h2 class="display-4">Vitajte na stránke Festival Info!</h2>
        <p class="lead">Získajte najnovšie informácie o rôznych festivaloch z celého sveta.</p>
      </div>
      <section>
        <h2 class="mb-4">Nadchádzajúce Festivaly</h2>
        <div v-for="festival in upcomingFestivals" :key="festival.id" class="card mb-3">
          <div class="card-body">
            <h5 class="card-title">{{ festival.name }}</h5>
            <p class="card-text">{{ festival.date }}</p>
            <p class="card-text">{{ festival.location }}</p>
            <router-link :to="'/festivals/' + festival.id" class="btn btn-primary">Čítaj viac</router-link>
          </div>
        </div>
      </section>
    </div>

    <footer class="bg-dark text-white text-center p-3">
      <p>&copy; 2024 Festival Info. Všetky práva vyhradené.</p>
    </footer>
  </div>
</template>

<script>
import { useFestivalStore } from '@/stores/festival';

export default {
  name: 'HomePage',
  data() {
    return {
      store: useFestivalStore(),
    };
  },
  mounted() {
    this.store.fetchFestivals()
  },
  computed: {
    upcomingFestivals() {
      return this.store.getFestivals()
    },
  },
};
</script>

<style scoped>
</style>

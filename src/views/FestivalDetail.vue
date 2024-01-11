<template>
  <div v-if="isLoading">Loading...</div>
  <div v-else-if="festival" class="container mt-4">
    <Carousel :carouselId="`festival-${festival.id}-carousel`" :slides="carouselSlides" />
    <div class="main">
      <h2 class="my-3">{{ festival.name }}</h2>
      <hr>
      <div class="row">
        <div class="col-md-6">
          <div class="row">
            <p class="col-3 my-3"><strong>From</strong></p>
            <p class="col-9 my-3">{{ formatDate(festival.date_from) }}</p>
          </div>
          <hr>
        </div>
        <div class="col-md-6">
          <div class="row">
            <p class="col-3 my-3"><strong>Location</strong> </p>
            <p class="col-9 my-3">{{ festival.location }}</p>
          </div>
          <hr>
        </div>
        <div class="col-md-6">
          <div class="row">
            <p class="col-3 my-3"><strong>To</strong></p>
            <p class="col-9 my-3">{{ formatDate(festival.date_to) }}</p>
          </div>
          <hr>
        </div>

        <div class="col-md-6">
          <div class="row">
            <p class="col-3 my-3"><strong>Address</strong> </p>
            <p class="col-9 my-3">{{ festival.country }}, {{ festival.city }}, {{ festival.street }} {{
              festival.st_number }}</p>
          </div>
          <hr>
        </div>
        <div class="col-md-6">
          <div class="row">
            <p class="col-3 my-3"><strong>Web</strong> </p>
            <p class="col-9 my-3">{{ festival.web }}</p>
          </div>
          <hr>
        </div>
        <div class="col-md-6">
          <div class="row">
            <p class="col-3 my-3"><strong>Price</strong></p>
            <p class="col-9 my-3">{{ festival.price }}€</p>
          </div>
          <hr>
        </div>
      </div>
      <h5 class="my-3"><strong>Description</strong></h5>
      <p class="my-3">{{ festival.description }}</p>
      <hr>
      <h5 class="my-3"><strong>Performing musicians</strong></h5>
      <div class="row justify-content-center">
        <MusicianCard v-for="musician in festival.musicians" :key="musician.id" :musician="musician" />
      </div>
    </div>
  </div>
  <Alert v-else type="danger" message="Festival with this id not found." />
</template>
  
<script>
import { useFestivalStore } from '@/stores/festival';
import MusicianCard from '@/components/MusicianCard.vue';
import Carousel from '@/components/Carousel.vue';
import Alert from '@/components/Alert.vue';
export default {
  name: 'FestivalDetail',
  components: {
    Carousel,
    MusicianCard,
    Alert,
  },
  data() {
    return {
      isLoading: true,
      festivalStore: useFestivalStore(),
      carouselSlides: [
        { imageSrc: 'https://placehold.co/1000x400/png', altText: 'Placeholder 1' },
        { imageSrc: 'https://placehold.co/1000x400/png', altText: 'Placeholder 2' },
        { imageSrc: 'https://placehold.co/1000x400/png', altText: 'Placeholder 3' },
      ]
    };
  },
  methods: {
    formatDate(date) {
      const options = { day: 'numeric', month: 'long', year: 'numeric' };
      return new Date(date).toLocaleDateString('en-GB', options);
    },
  },
  mounted() {
    this.festivalStore.fetchFestivals().then(() => {
      this.isLoading = false;
    });
  },
  computed: {
    festival() {
      return this.festivalStore.getFestivalById(this.$route.params.id);
    },
  },
};
</script>

<style scoped>
hr {
  margin: 0;
}

.main {
  border-radius: 10px;
  border: 1px solid #e6e6e6;
  padding: 0 1rem 0.2rem 1rem;
  margin: 1rem 0 1rem 0;
}
</style>
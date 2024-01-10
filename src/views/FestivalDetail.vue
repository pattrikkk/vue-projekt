<template>
  <div v-if="festival" class="container mt-4">
    <Carousel :carouselId="`festival-${festival.id}-carousel`" :slides="carouselSlides" />
    <div class="container border my-2">
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
      <p class="my-3"><strong>Description</strong></p>
      <p class="my-3">{{ festival.description }}</p>
    </div>
  </div>
</template>
  
<script>
import { useFestivalStore } from '@/stores/festival';
import Carousel from '@/components/Carousel.vue';
export default {
  name: 'FestivalDetail',
  components: {
    Carousel,
  },
  data() {
    return {
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
    this.festivalStore.fetchFestivals()
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
.container {
  border-radius: 10px;
  border:0;
}
</style>
<template>
  <div v-if="festival" class="container mt-4">
    <Carousel :carouselId="`festival-${festival.id}-carousel`" :slides="carouselSlides" />
    <h2 class="mb-3">{{ festival.name }}</h2>
    <p class="mb-2"><strong>Date:</strong> {{ festival.date_from }} - {{ festival.date_to }}</p>
    <p class="mb-2"><strong>Location:</strong> {{ festival.country }}, {{ festival.city }}, {{ festival.street }} {{ festival.st_number }}</p>
    <p class="mb-2"><strong>Price:</strong> {{ festival.price }}€</p>
    <p class="mb-2"><strong>Description:</strong> {{ festival.description }}</p>
    
    <div v-if="stages.length > 0" class="mb-2">
      <strong>Stages:</strong>
      <ul>
        <li v-for="stage in stages" :key="stage.id">
          {{ stage.name }}
        </li>
      </ul>
    </div>
  </div>
</template>


  
<script>
import { useFestivalStore } from '@/stores/festival';
import { useStageStore } from '@/stores/stage';
import Carousel from '@/components/Carousel.vue';
export default {
  name: 'FestivalDetail',
  components: {
    Carousel,
  },
  data() {
    return {
      festivalStore: useFestivalStore(),
      stageStore: useStageStore(),
      carouselSlides: [
        { imageSrc: 'https://placehold.co/1000x400/png', altText:'Placeholder 1'},
        { imageSrc: 'https://placehold.co/1000x400/png', altText:'Placeholder 2'},
        { imageSrc: 'https://placehold.co/1000x400/png', altText:'Placeholder 3'},
      ]
    };
  },
  mounted() {
    this.festivalStore.fetchFestivals()
    this.stageStore.fetchStages()
  },
  computed: {
    festival() {
      return this.festivalStore.getFestivalById(this.$route.params.id);
    },
    stages() {
      return this.stageStore.getStagesFromFestivalID(this.$route.params.id);
    },
  },
};
</script>
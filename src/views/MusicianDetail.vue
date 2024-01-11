<template>
    <div v-if="isLoading">Loading...</div>
    <div v-else-if="musician" class="container mt-4">
        <Carousel :carouselId="`musician-${musician.id}-carousel`" :slides="carouselSlides" />
        <div class="main">
            <h2 class="my-3">{{ musician.name }}</h2>
            <hr>
            <div class="row">
                <div class="col-md-6">
                    <div class="row">
                        <p class="col-3 my-3"><strong>Country</strong></p>
                        <p class="col-9 my-3">{{ musician.country }}</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <p class="col-3 my-3"><strong>Genre</strong></p>
                        <p class="col-9 my-3">{{ musician.genre }}</p>
                    </div>
                </div>
            </div>
            <hr>

            <h5 class="my-3"><strong>About</strong></h5>
            <p class="my-3">{{ musician.about }}</p>
            <hr>
            <h5 class="my-3"><strong>Calendar</strong></h5>
            <Calendar class="pb-3" :dates="musician.festivals" />
            <hr>
            <h5 class="my-3"><strong>Performs at these festivals</strong></h5>
            <div class="row">
                <FestivalCard v-for="festival in musician.festivals" :key="festival.id" :festival="festival" />
            </div>
        </div>
    </div>
    <Alert v-else :type="'danger'" :message="'Musician not found.'" />
</template>
    
<script>
import { useMusicianStore } from '@/stores/musician';
import FestivalCard from '@/components/FestivalCard.vue';
import Carousel from '@/components/Carousel.vue';
import Calendar from '@/components/Calendar.vue';
import Alert from '@/components/Alert.vue';
export default {
    name: 'MusicianDetail',
    components: {
        Carousel,
        FestivalCard,
        Calendar,
        Alert,
    },
    data() {
        return {
            musicianStore: useMusicianStore(),
            isLoading: true,
            carouselSlides: [
                { imageSrc: 'https://placehold.co/1000x400/png', altText: 'Placeholder 1' },
                { imageSrc: 'https://placehold.co/1000x400/png', altText: 'Placeholder 2' },
                { imageSrc: 'https://placehold.co/1000x400/png', altText: 'Placeholder 3' },
            ]
        };
    },
    mounted() {
        this.musicianStore.fetchMusicians().then(() => {
            this.isLoading = false;
        });
    },
    computed: {
        musician() {
            return this.musicianStore.getMusicianByID(this.$route.params.id);
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
    padding: 0 1rem 0 1rem;
    margin: 1rem 0 1rem 0;
}
</style>
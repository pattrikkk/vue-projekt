<template>
  <div :id="carouselId" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li v-for="(slide, index) in slides" :key="index" :data-target="carouselId" :data-slide-to="index" :class="{ active: index === 0 }"></li>
    </ol>
    <div class="carousel-inner">
      <div v-for="(slide, index) in slides" :key="index" :class="{ 'carousel-item': true, active: index === 0 }">
        <img :src="slide.imageSrc" :alt="slide.altText" class="d-block w-100 carousel-image">
        <div v-if="slide.title">
          <div class="carousel-caption d-none d-md-block">
            <h3>{{ slide.title }}</h3>
            <p class="m-1">{{ slide.description }}</p>
          </div>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" :href="`#${carouselId}`" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" :href="`#${carouselId}`" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</template>
  
  <script>
  export default {
    props: {
      carouselId: {
        type: String,
        required: true,
      },
      slides: {
        type: Array,
        required: true,
      },
    },
  };
  </script>
  
  <style scoped>
  .carousel {
    margin-bottom: 1rem;	
  }
  .carousel-image {
    border-radius: 10px;
  }
  </style>
  
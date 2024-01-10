<template>
  <div class="col-md-4">
    <div class="card mb-4 festival-card">
      <img class="card-img-top" src="https://placehold.co/300x200/png" alt="Placeholder">
      <div class="card-body">
        <RouterLink class="card-title" :to="'/festivals/' + festival.id">{{ festival.name }}</RouterLink>
        <p class="card-desc">{{ formatDate(festival.date_from) }} - {{ formatDate(festival.date_to) }}</p>
        <p class="card-desc">{{ festival.location }}</p>
      </div>
    </div>
  </div>
</template>
  
<script>
import { RouterLink } from 'vue-router';

export default {
  props: {
    festival: {
      type: Object,
      required: true,
    },
  },
  methods: {
    formatDate(date) {
      const options = { day: 'numeric', month: 'short', year: 'numeric' };
      return new Date(date).toLocaleDateString('en-GB', options);
    },
  },
  components: { RouterLink }
};
</script>
  
<style scoped>
.festival-card {
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  border:0;
}

.card-img-top {
  border-radius: 10px 10px 0 0;
  transition: 0.3s ease;
}

.card-img-top:hover {
  filter: brightness(90%);
}

.card-body {
  display: flex;
  flex-direction: column;
}

.card-title {
  font-size: 1.5rem;
  margin-bottom: 0.5rem;
}

.card-title:hover {
  text-decoration: none;
}

.card-desc {
  margin: 0;
  color: #6c757d;
}
</style>
  
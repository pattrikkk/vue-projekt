<template>
  <div class="col-md-3">
    <div class="card mb-4 interpret-card">
      <div class="card-body">
        <img class="rounded" src="https://placehold.co/150x150/png" alt="Placeholder">
        <hr>
        <RouterLink class="card-title text-center" :to="'/interprets/' + interpret.id">{{ interpret.name }}
        </RouterLink>
        <p class="card-desc text-center">{{ interpret.country }}</p>
      </div>
    </div>
  </div>
</template>
    
<script>
import { RouterLink } from 'vue-router';

export default {
  props: {
    interpret: {
      type: Object,
      required: true,
    },
  },
  components: { RouterLink }
};
</script>
    
<style scoped>
.interpret-card {
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  border: 0;
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

.rounded {
  border-radius: 100% !important;
  width: 150px;
  height: 150px;
  margin: 0 auto;
  margin-bottom: 1rem;
  object-fit: cover;
}

</style>
    
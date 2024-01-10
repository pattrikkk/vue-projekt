<template>
    <div class="col-md-3">
      <div class="card mb-4 interpret-card">
        <img class="card-img-top" src="https://placehold.co/300x200/png" alt="Placeholder">
        <div class="card-body">
          <RouterLink class="card-title" :to="'/interprets/' + interpret.id">{{ interpret.name }}</RouterLink>
          <p class="card-desc">{{ interpret.country }}</p>
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
    
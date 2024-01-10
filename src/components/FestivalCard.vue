<template>
    <div class="col-md-4">
      <div class="card mb-4 festival-card">
        <div class="card-body">
          <h5 class="card-title">{{ festival.name }}</h5>
          <p class="card-dates">{{ formatDate(festival.date_from) }} - {{ formatDate(festival.date_to) }}</p>
          <p class="card-location">{{ festival.country }}, {{ festival.city }}</p>
          <router-link :to="'/festivals/' + festival.id" class="btn btn-primary">Read more</router-link>
        </div>
      </div>
    </div>
  </template>
  
  <script>
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
  };
  </script>
  
  <style scoped>
  .festival-card {
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }
  
  .card-body {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
  }
  
  .card-title {
    font-size: 1.5rem;
    margin-bottom: 0.5rem;
  }
  
  .card-dates {
    font-weight: bold;
  }
  
  .card-location {
    margin-top: 0.5rem;
    font-style: italic;
  }
  
  .btn-primary {
    margin-top: 1rem;
    border: none;
  }
  </style>
  
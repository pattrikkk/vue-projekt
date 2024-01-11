<template>
    <div v-if="show" class="alert" :class="`alert-${type}`" role="alert">
      {{ message }}
      <button type="button" class="close" @click="closeAlert">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
  </template>
  
  <script>
  export default {
    props: {
      type: {
        type: String,
        default: 'info',
      },
      message: {
        type: String,
        required: true,
      },
    },
    data() {
      return {
        show: true,
      };
    },
    methods: {
      closeAlert() {
        this.show = false;
      },
    },
  };
  </script>
  
  <style scoped>
  .alert {
    margin-top: 20px;
  }
  </style>
  
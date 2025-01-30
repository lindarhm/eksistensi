<template>
    <div class="card h-100">
      <div class="card-body">
        <h5 class="card-title">{{ psikolog.name }}</h5>
        <p class="card-text">{{ psikolog.specialization }}</p>
        <router-link
        :to="`/detail-psikolog/${psikolog.id}`"
        class="btn btn-primary w-100">Hubungi</router-link>  
    </div>
    </div>
  </template>
  
  <script lang="ts">
  import { defineComponent, PropType } from 'vue';
  
  export default defineComponent({
    name: 'PsikologCard',
    props: {
      psikolog: {
        type: Object as PropType<{ name: string; specialization: string; id: number }>,
        required: true,
      },
    },
  });
  </script>
  
  <style scoped>
  .card {
    transition: transform 0.2s ease-in-out;
  }
  
  .card:hover {
    transform: scale(1.05);
  }
  
  .card-body {
    padding: 1.5rem;
  }
  
  .card-title {
    font-size: 1.25rem;
    font-weight: bold;
  }
  
  .card-text {
    font-size: 1rem;
    color: #555;
  }
  
  .btn-primary {
    margin-top: 10px;
  }
  </style>
  
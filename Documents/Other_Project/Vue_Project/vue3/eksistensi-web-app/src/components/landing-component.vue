<template>
    <div class="landing-section">
      <slot></slot> 
    </div>
  </template>
  
  <script>
  export default {
    name: 'LandingComponent'
  }
  </script>
  
  <style scoped>
.landing-section {
  height: 100vh; 
  width: 100%;  
  text-align: center;
  margin: 0 auto;
  background: linear-gradient(to left, rgba(255, 255, 255, 0.95), rgba(255, 230, 230, 0.3), rgba(200, 240, 255, 0.3));
}
  </style>
  
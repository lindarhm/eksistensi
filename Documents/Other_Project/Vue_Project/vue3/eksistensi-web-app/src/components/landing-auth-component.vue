<template>
    <div class="landing-section">
      <slot></slot> 
    </div>
  </template>
  
  <script>
  export default {
    name: 'LandingAuthComponent'
  }
  </script>
  
  <style scoped>
  .landing-section {
    height: 100vh; 
    width: 100%;  
    text-align: center;
    margin: 0 auto;
    background-image: url('../assets/images/background-shapes.png'); 
    background-size: cover;
    background-position: center; 
    background-repeat: no-repeat;
  }
  </style>
  
<template>
    <HeaderComponent />    
    <LandingComponent>
      <div v-if="loading" class="loading">Loading...</div>
      <div v-else-if="error" class="error">{{ error }}</div>
      <div v-else class="profile-container">
        <h2>User Profile</h2>
        <div class="profile-details">
          <div class="row">
            <div class="label">Name:</div>
            <div class="value">{{ profile.firstname }} {{ profile.lastname }}</div>
          </div>
          <div class="row">
            <div class="label">Email:</div>
            <div class="value">{{ profile.email }}</div>
          </div>
          <div class="row">
            <div class="label">Phone:</div>
            <div class="value">{{ profile.phone }}</div>
          </div>
          <div class="row">
            <div class="label">Date of Birth:</div>
            <div class="value">{{ profile.dob }}</div>
          </div>
          <div class="row">
            <div class="label">Gender:</div>
            <div class="value">{{ profile.gender === 'L' ? 'Male' : 'Female' }}</div>
          </div>
          <div class="row">
            <div class="label">Marriage Status:</div>
            <div class="value">{{ profile.marriage }}</div>
          </div>
          <!-- Add more fields here as needed -->
        </div>
      </div>
    </LandingComponent>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  import axios from 'axios';
  import LandingComponent from '../components/landing-component.vue';
  import HeaderComponent from '../components/header-component.vue';
  
  const loading = ref(true);
  const error = ref('');
  const profile = ref({});
  
  const getUserProfile = async () => {
    const token = localStorage.getItem('token'); // Retrieve token from localStorage
    const email = localStorage.getItem('email'); // Retrieve email from localStorage
  
    try {
      const response = await axios.post(
        'get_user_profile',
        {
          email: email // Include email in the payload
        },
        {
          headers: {
            Authorization: `Bearer ${token}` // Pass token in Authorization header
          }
        }
      );
      profile.value = response.data.user; // Assuming 'user' is the key holding the profile data
    } catch (err) {
      error.value = 'Failed to fetch profile data.';
    } finally {
      loading.value = false;
    }
  };
  
  onMounted(() => {
    getUserProfile();
  });
  </script>
  
  <style scoped>
  .profile-container {
    display: flex;
    flex-direction: column;
    justify-content: center; /* Centers content vertically */
    align-items: center; /* Centers content horizontally */
    min-height: 100vh; /* Ensures it takes full viewport height */
    background-color: #f9f9f9;
    padding: 20px;
  }
  
  .loading,
  .error {
    font-size: 18px;
    color: #555;
    text-align: center;
  }
  
  .error {
    color: red;
  }
  
  .profile-details {
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    padding: 20px;
    width: 100%;
    max-width: 600px; /* Limits the width */
  }
  
  .row {
    display: flex;
    justify-content: space-between;
    margin: 10px 0;
  }
  
  .label {
    font-weight: bold;
    color: #333;
  }
  
  .value {
    color: #555;
  }
  </style>
  
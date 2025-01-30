<template>
    <LandingAuthComponent>
      <div class="d-flex justify-content-center align-items-center" style="min-height: 100vh;">
  <div class="form-container rounded p-4 bg-white shadow" style="max-width: 500px; width: 100%; max-height: 90vh; overflow-y: auto;">
    <h2 class="mb-4 text-center">Register</h2>
    <form @submit.prevent="handleRegister">
      <div class="mb-3">
        <p for="firstname" class="text-start">First Name</p>
        <input type="text" v-model="form.firstname" class="form-control" id="firstname" required />
      </div>
      <div class="mb-3">
        <p for="lastname" class="form-label text-start">Last Name</p>
        <input type="text" v-model="form.lastname" class="form-control" id="lastname" required />
      </div>
      <div class="mb-3">
        <p for="email" class="form-label text-start">Email</p>
        <input type="email" v-model="form.email" class="form-control" id="email" required />
      </div>
      <div class="mb-3">
        <p for="phone" class="form-label text-start">Phone</p>
        <input type="text" v-model="form.phone" class="form-control" id="phone" required />
      </div>
      <div class="mb-3">
        <p for="passwd" class="form-label text-start">Password</p>
        <input type="password" v-model="form.passwd" class="form-control" id="passwd" required />
      </div>
      <div class="mb-3">
        <p for="dob" class="form-label text-start">Date of Birth</p>
        <input type="date" v-model="form.dob" class="form-control" id="dob" required />
      </div>
      <div class="mb-3">
        <p for="placeOfBirth" class="form-label text-start">Place of Birth</p>
        <input type="text" v-model="form.placeOfBirth" class="form-control" id="placeOfBirth" required />
      </div>
      <div class="mb-3">
        <p for="gender" class="form-label text-start">Gender</p>
        <select v-model="form.gender" class="form-select" id="gender" required>
          <option value="L">Male</option>
          <option value="P">Female</option>
        </select>
      </div>
      <div class="mb-3">
        <p for="ethnic" class="form-label text-start">Ethnic</p>
        <input type="text" v-model="form.ethnic" class="form-control" id="ethnic" required />
      </div>
      <div class="mb-3">
        <p for="religion" class="form-label text-start">Religion</p>
        <input type="text" v-model="form.religion" class="form-control" id="religion" required />
      </div>
      <div class="mb-3">
        <p for="lastEducation" class="form-label text-start">Last Education</p>
        <input type="text" v-model="form.lastEducation" class="form-control" id="lastEducation" required />
      </div>
      <div class="mb-3">
        <p for="occupation" class="form-label text-start">Occupation</p>
        <input type="text" v-model="form.occupation" class="form-control" id="occupation" required />
      </div>
      <div class="mb-3">
        <p for="maritalStatus" class="form-label text-start">Marital Status</p>
        <select v-model="form.maritalStatus" class="form-select" id="maritalStatus" required>
          <option value="single">Single</option>
          <option value="married">Married</option>
        </select>
      </div>
      <div class="mb-3">
        <p for="referredFrom" class="form-label text-start">Referred From</p>
        <input type="text" v-model="form.referredFrom" class="form-control" id="referredFrom" />
      </div>
      <button type="submit" class="btn btn-primary w-100">Register</button>
    </form>
  </div>
</div>

    </LandingAuthComponent>
  </template>
  
  <script lang="ts">
  import { defineComponent, reactive } from 'vue';
import LandingAuthComponent from '../components/landing-auth-component.vue';
  
  export default defineComponent({
    components: { LandingAuthComponent  },
    setup() {
  
      const form = reactive({
        firstname: '',
        lastname: '',
        email: '',
        phone: '',
        passwd: '',
        dob: '',
        placeOfBirth: '',
        gender: 'L',
        ethnic: '',
        religion: '',
        lastEducation: '',
        occupation: '',
        maritalStatus: 'single',
        referredFrom: '',
        role: 'user',
      });
  
      const handleRegister = () => {
        console.log('Register data:', form);
        // auth.register(form);
      };
  
      return { form, handleRegister };
    },
  });
  </script>
  
  <style scoped>
  /* .form-container {
    max-width: 500px;
    background-color: rgba(255, 255, 255, 0.9);
  } */
  </style>
  
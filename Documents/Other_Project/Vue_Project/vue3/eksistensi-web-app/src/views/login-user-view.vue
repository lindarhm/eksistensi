<template>
  <LandingAuthComponent>
    <div class="d-flex justify-content-center align-items-center" style="min-height: 100vh;">
      <div class="form-container rounded p-4 bg-white shadow" style="max-width: 400px; width: 100%; max-height: 90vh; overflow-y: auto;">
        <h2 class="mb-4 text-center">Login</h2>
        <form @submit.prevent="handleLogin">
          <div class="mb-3">
            <label for="email" class="form-label text-left d-block">Email</label>
            <input type="email" v-model="form.email" class="form-control" id="email" required />
          </div>
          <div class="mb-3">
            <label for="password" class="form-label text-left d-block">Password</label>
            <input type="password" v-model="form.password" class="form-control" id="password" required />
          </div>
          <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>
        <p class="mt-3 text-center">
          Don't have an account? <a href="/register" class="text-primary">Register here</a>
        </p>
      </div>
    </div>
  </LandingAuthComponent>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import { useAuthentication } from '../stores/authetication-store';
import LandingAuthComponent from '../components/landing-auth-component.vue';

// Reactive form data
const form = ref({
  email: '',
  password: '',
});

// Router instance
const router = useRouter();

// Use Pinia store
const auth = useAuthentication();

// Login handler
const handleLogin = async () => {
  try {
    await auth.login(form.value.email, form.value.password);

    // Debugging
    console.log('Login berhasil');
    console.log('Token setelah login:', auth.token);

    // Pastikan token ada sebelum navigasi
    if (auth.token) {
      console.log('Pindah ke:', { name: 'dashboard' });
      router.replace({ name: 'dashboard' });
    } else {
      console.error('Token tidak ditemukan setelah login.');
      alert('Login berhasil, tetapi tidak dapat masuk ke dashboard.');
    }
  } catch (error) {
    console.error('Login gagal:', error);
    alert('Login failed. Please check your credentials.');
  }
};
</script>

<style scoped>
/* Tambahkan style sesuai kebutuhan */
.form-label {
  text-align: left !important; /* Pastikan teks rata kiri */
}
</style>

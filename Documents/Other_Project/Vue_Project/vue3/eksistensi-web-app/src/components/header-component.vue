<template>
  <header>
    <nav class="navbar navbar-expand-lg navbar-light bg-transparent px-4 py-2">
      <div class="container-fluid">
        <a class="navbar-brand fs-4 fw-semibold text-dark" href="/dashboard">
          <img src="../assets/icons/logo.png" alt="Logo" class="d-inline-block align-text-top" style="height: 50px;" />
        </a>

        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
          aria-controls="navbarNav"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item" v-if="authStore.isLogged">
              <router-link to="/calendar" class="nav-link text-dark fw-medium">
                Calendar (Admin)
              </router-link>
            </li>
            <li class="nav-item" v-if="authStore.isLogged">
              <router-link to="/psikolog-list-admin" class="nav-link text-dark fw-medium">
                Psikolog (Admin)
              </router-link>
            </li>
            <li class="nav-item" v-if="authStore.isLogged">
              <router-link to="/history-admin" class="nav-link text-dark fw-medium">
                History (Admin)
              </router-link>
            </li>
            <li class="nav-item" v-if="authStore.isLogged">
              <router-link to="/psikolog-list" class="nav-link text-dark fw-medium">
                Psikolog (User)
              </router-link>
            </li>
            <li class="nav-item" v-if="authStore.isLogged">
              <a class="nav-link text-dark fw-medium" href="/history-user">Riwayat (User)</a>
            </li>

            <!-- Tampilkan email jika login -->
            <li v-if="authStore.isLogged" class="nav-item">
              <button
                class="btn btn-outline-dark ms-lg-3"
                @click="toggleModal"
              >
                {{ userEmail }}
              </button>
            </li>

            <!-- Login Button -->
            <li class="nav-item" v-else>
              <router-link to="/login">
                <button class="btn btn-outline-dark ms-lg-3">Sign In</button>
              </router-link>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Modal untuk Logout atau Profil -->
    <div
      v-if="isModalVisible"
      class="modal-backdrop"
      @click.self="toggleModal"
    >
      <div class="modal-content p-4">
        <p class="mb-3">Pilih aksi:</p>
        <div class="d-flex justify-content-between">
          <button class="btn btn-outline-primary mb-2" @click="goToProfile">Detail Profil</button>
          <button class="btn btn-danger mb-2" @click="logout">Logout</button>
        </div>
      </div>
    </div>
  </header>
</template>

<script setup>
import { ref, computed } from 'vue';
import { useAuthentication } from '../stores/authetication-store';
import { useRouter } from 'vue-router';

const authStore = useAuthentication();
const isModalVisible = ref(false);
const router = useRouter();

// Ambil email dari localStorage
const userEmail = computed(() => localStorage.getItem('email') || 'User');

// Fungsi untuk menampilkan/menghilangkan modal
const toggleModal = () => {
  isModalVisible.value = !isModalVisible.value;
};

// Fungsi logout
const logout = () => {
  authStore.logout();
  toggleModal();
  router.push('/login'); 
};

// Fungsi untuk menuju ke halaman profil
const goToProfile = () => {
  router.push('/profile'); 
  toggleModal();
};
</script>

<style scoped>
.modal-backdrop {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1050;
}

.modal-content {
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  max-width: 400px;
  width: 90%;
}

.d-flex {
  display: flex;
}
.justify-content-between {
  justify-content: space-between;
}
</style>

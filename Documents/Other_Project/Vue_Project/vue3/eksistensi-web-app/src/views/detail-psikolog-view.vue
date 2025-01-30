<template>
  <LandingComponent>
    <HeaderComponent />
    <div class="container my-4">
      <h3 class="text-center mb-4">Detail Psikolog</h3>

      <div v-if="!psikolog" class="text-danger text-center">Data tidak ditemukan!</div>

      <div v-else class="row g-4">
        <div class="col-md-4">
          <div class="card">
            <img 
              :src="psikolog.imgSrc || 'https://via.placeholder.com/400'" 
              class="card-img-top" 
              alt="Foto Psikolog"
            />
            <div class="card-body">
              <h5 class="card-title mb-1">{{ psikolog.name }}</h5>
            </div>
          </div>
        </div>

        <!-- Bagian Kanan: Detail Psikolog dan Form Pemesanan -->
        <div class="col-md-8">
          <div class="card p-4">

         
   <!-- Informasi Psikolog -->
    <div v-if="!sessionBooked">
   <h5 class="mb-3 text-start">Tentang {{ psikolog.name }}</h5>
            <p class="text-start"><strong>Pendidikan</strong></p>
            <p class="text-start"><strong>Nomor Izin Praktek</strong></p>
            </div>
            <!-- Pilih Sesi -->
            <h6 class="text-start" v-if="!sessionBooked">Pilih Berdasarkan Sesi</h6>
            <form v-if="!sessionBooked" @submit.prevent="bookSession">
              <div class="mb-1 text-start">
                <label for="session-type" class="form-label text-start">Tipe Sesi</label>
                <select id="session-type" class="form-select" v-model="selectedSession.type">
                  <option value="Online">Online</option>
                  <option value="Offline">Offline</option>
                </select>
              </div>

              <div class="mb-2 text-start">
                <label for="session-date" class="form-label text-start">Tanggal</label>
                <input 
                  type="date" 
                  id="session-date" 
                  class="form-control" 
                  v-model="selectedSession.date"
                />
              </div>

              <div class="mb-2 text-start">
                <label for="session-time" class="form-label text-start">Waktu</label>
                <select id="session-time" class="form-select" v-model="selectedSession.time">
                  <option v-for="time in availableTimes" :key="time" :value="time">
                    {{ time }}
                  </option>
                </select>
              </div>

              <button type="submit" class="btn btn-primary w-100">Pilih Sesi</button>
            </form>

            <!-- Bagian Biru untuk Informasi Konsultasi -->
            <div v-if="sessionBooked" class="card mb-3">
              <div class="card-body bg-light-blue text-start">
                <h5 class="card-title mb-3">Konsultasi Online</h5>
                <div class="row">
                  <div class="col-8">
                    <p class="mb-1">
                      <strong>Janji Konsultasi:</strong><br />
                      {{ selectedSession.date || 'Tanggal belum dipilih' }} | {{ selectedSession.time || 'Waktu belum dipilih' }}
                    </p>
                  </div>
                  <div class="col-4 text-end">
                    <p class="mb-1">
                      <strong>Total: 300.000</strong><br />
                      {{ new Date().toLocaleDateString('id-ID') }} | {{ new Date().toLocaleTimeString('id-ID') }}
                    </p>
                  </div>
                </div>
              </div>
            </div>

            <!-- Form Pembayaran -->
            <div v-if="sessionBooked">
              <h6 class="text-start">Pembayaran</h6>
              <div class="mb-2 text-start">
                <label for="payment-method" class="form-label text-start">Metode Pembayaran</label>
                <select id="payment-method" class="form-select" v-model="paymentMethod">
                  <option value="Transfer">Transfer</option>
                </select>
              </div>

              <div class="mb-2 text-start">
                <p class="mb-1">Rekening: <strong>BCA: 3890098716</strong></p>
              </div>

              <!-- Form Upload Bukti Pembayaran -->
              <h6 class="text-start">Upload Bukti Pembayaran</h6>
              <form @submit.prevent="uploadProof">
                <div class="mb-2 text-start">
                  <label for="proof-upload" class="form-label text-start">Upload Gambar</label>
                  <input 
                    type="file" 
                    id="proof-upload" 
                    class="form-control" 
                    @change="handleFileUpload"
                  />
                </div>
                <button type="submit" class="btn btn-primary w-100">Upload</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </LandingComponent>
</template>

<script lang="ts">
import { computed, ref } from 'vue';
import { usePsikologStore } from '../stores/psikolog-store';
import LandingComponent from '../components/landing-component.vue';
import HeaderComponent from '../components/header-component.vue';

export default {
  name: 'PsikologDetailView',
  components: {
    LandingComponent,
    HeaderComponent,
  },
  setup() {
    const psikologStore = usePsikologStore();
    const psikolog = computed(() => psikologStore.selectedPsikolog); // Mengambil data psikolog dari Pinia store

    const selectedSession = ref({
      type: 'Online',
      date: '',
      time: '',
    });

    const availableTimes = ['09.00 WIB', '10.00 WIB', '11.00 WIB', '13.00 WIB'];
    const sessionBooked = ref(false);
    const uploadedFile = ref<File | null>(null);
    const paymentMethod = ref('Transfer');

    const bookSession = () => {
      if (!selectedSession.value.date || !selectedSession.value.time) {
        alert('Harap pilih tanggal dan waktu sesi.');
        return;
      }

      sessionBooked.value = true;
      alert('Sesi berhasil dipesan! Silakan upload bukti pembayaran.');
    };

    const handleFileUpload = (event: Event) => {
      const target = event.target as HTMLInputElement;
      if (target.files && target.files[0]) {
        uploadedFile.value = target.files[0];
      }
    };

    const uploadProof = () => {
      if (!uploadedFile.value) {
        alert('Harap upload bukti pembayaran.');
        return;
      }

      console.log('Bukti pembayaran berhasil diupload:', uploadedFile.value);
      alert('Bukti pembayaran berhasil diupload!');
    };

    return {
      psikolog,
      selectedSession,
      availableTimes,
      sessionBooked,
      uploadedFile,
      paymentMethod,
      bookSession,
      handleFileUpload,
      uploadProof,
    };
  },
};
</script>

<style scoped>
.card {
  border-radius: 0.5rem;
  overflow: hidden;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.card-img-top {
  height: 300px;
  object-fit: cover;
}

.container {
  max-width: 960px;
  margin: auto;
}

.bg-light-blue {
  background-color: #e7f3ff;
}
</style>

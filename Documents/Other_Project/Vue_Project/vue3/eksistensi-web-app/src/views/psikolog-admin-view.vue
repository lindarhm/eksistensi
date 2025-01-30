<template>
  <LandingComponent>
    <HeaderComponent />
    <div class="container my-4">
      <div v-if="loading" class="text-center">Loading...</div>
      <div v-else-if="error" class="text-danger text-center">{{ error }}</div>
      <div v-else>
        <div class="d-flex justify-content-between mb-3">
          <h5>Daftar Psikolog</h5>
          <button @click="openAddModal" class="btn btn-primary">Add Psikolog</button>
        </div>

        <table class="table table-bordered">
          <thead>
            <tr>
              <th>Nama Psikolog</th>
              <th>Spesialisasi</th>
              <th>Jadwal Online</th>
              <th>Jadwal Offline</th>
              <th>Ulasan</th>
              <th>Aksi</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="psikolog in psikologs" :key="psikolog.id">
              <td>{{ psikolog.name }}</td>
              <td>{{ psikolog.specialization || 'Tidak ada' }}</td>
              <td>
                <ul>
                  <!-- <li v-for="slot in psikolog.availableSlots" :key="slot.date" v-if="slot.online">
                    <strong>{{ slot.date }}</strong>
                    <ul>
                      <li v-for="time in slot.times" :key="time">{{ time }}</li>
                    </ul>
                  </li> -->
                </ul>
              </td>
              <td>
                <ul>
                  <!-- <li v-for="slot in psikolog.availableSlots" :key="slot.date" v-if="slot.offline">
                    <strong>{{ slot.date }}</strong>
                    <ul>
                      <li v-for="time in slot.times" :key="time">{{ time }}</li>
                    </ul>
                  </li> -->
                </ul>
              </td>
              <td>
                <ul>
                  <li v-for="review in psikolog.reviews" :key="review.dateCreated">
                    <p><strong>Rating:</strong> {{ review.rating }} / 5</p>
                  </li>
                </ul>
              </td>
              <td>
                <button @click="openEditModal(psikolog)" class="btn btn-warning">Edit</button>
              </td>
            </tr>
          </tbody>
        </table>

        <!-- Modal Add Psikolog -->
        <div v-if="isAddModalOpen" class="modal fade show" tabindex="-1" style="display: block;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Add Psikolog</h5>
                <button type="button" class="btn-close" @click="closeAddModal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <div class="text-start">
                  <label for="name" class="text-start">Nama Psikolog:</label>
                  <input v-model="addForm.name" id="name" type="text" class="form-control" />
                </div>
                <div class="text-start">
                  <label for="specialization">Spesialisasi:</label>
                  <input v-model="addForm.specialization" id="specialization" type="text" class="form-control" />
                </div>
                <div class="text-start">
                  <label for="online_day">Jadwal Online Hari:</label>
                  <input v-model="addForm.onlineDay" id="online_day" type="date" class="form-control" />
                </div>
                <div class="text-start">
                  <label for="online_hour">Jadwal Online Jam:</label>
                  <input v-model="addForm.onlineHour" id="online_hour" type="time" class="form-control" />
                </div>

                <div class="text-start">
                  <label for="offline_day">Jadwal Offline Hari:</label>
                  <input v-model="addForm.offlineDay" id="offline_day" type="date" class="form-control" />
                </div>
                <div class="text-start">
                  <label for="offline_hour">Jadwal Offline Jam:</label>
                  <input v-model="addForm.offlineHour" id="offline_hour" type="time" class="form-control" />
                </div>
                <div class="text-start">
                  <label for="profilepicture">Profile Picture:</label>
                  <input id="profilepicture" type="file" class="form-control" accept="image/*" />
                </div>

                <div class="text-start">
                  <label for="experience">Pengalaman:</label>
                  <input v-model="addForm.experience" id="experience" type="text" class="form-control" />
                </div>
                <div class="text-start">
                  <label for="rating">Rating:</label>
                  <input v-model="addForm.rating" id="rating" type="number" min="0" max="5" class="form-control" />
                </div>
                <div class="text-start">
                  <label for="description">Deskripsi:</label>
                  <textarea v-model="addForm.description" id="description" class="form-control"></textarea>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" @click="closeAddModal">Close</button>
                <button type="button" class="btn btn-primary" @click="saveNewPsikolog">Save changes</button>
              </div>
            </div>
          </div>
        </div>

        <!-- Modal Edit Psikolog -->
        <div v-if="isModalOpen" class="modal fade show" tabindex="-1" style="display: block;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Edit Psikolog</h5>
                <button type="button" class="btn-close" @click="closeModal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <div class="text-start">
                  <label for="name">Nama Psikolog:</label>
                  <input v-model="editForm.name" id="name" type="text" class="form-control" />
                </div>
                <div class="text-start">
                  <label for="specialization">Spesialisasi:</label>
                  <input v-model="editForm.specialization" id="specialization" type="text" class="form-control" />
                </div>
                <div class="text-start">
                  <label for="slots">Jadwal Online:</label>
                  <textarea v-model="editForm.onlineSlots" id="slots" class="form-control"
                    placeholder="e.g., 9:00, 15:00"></textarea>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" @click="closeModal">Close</button>
                <button type="button" class="btn btn-primary" @click="saveChanges">Save changes</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </LandingComponent>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import HeaderComponent from '../components/header-component.vue';
import LandingComponent from '../components/landing-component.vue';
import axios from 'axios';

// Refs to hold state
const loading = ref(true);
const error = ref('');
const psikologs = ref<any[]>([]);
const isModalOpen = ref(false);
const isAddModalOpen = ref(false);
const editForm = ref({
  name: '',
  specialization: '',
  onlineSlots: ''
});
const addForm = ref({
  description: '',
  experience: '',
  name: '',
  offlineDay: '',
  offlineHour: '',
  onlineDay: '',
  onlineHour: '',
  profilepicture: '',
  rating: 0,
  specialization: ''
});

// Open the modal for adding a psikolog
const openAddModal = () => {
  isAddModalOpen.value = true;
};

// Close the modal for adding a psikolog
const closeAddModal = () => {
  isAddModalOpen.value = false;
};

const openEditModal = (psikolog: any) => {
  editForm.value = { ...psikolog };
  isModalOpen.value = true;
};

const closeModal = () => {
  isModalOpen.value = false;
};

const saveChanges = () => {
  closeModal();
};

const saveNewPsikolog = async () => {
  try {
    const token = localStorage.getItem('token');
    const response = await axios.post('psikolog', addForm.value, {
      headers: {
        Authorization: `Bearer ${token}`, 
      },
    });

    console.log('Psikolog added:', response.data);
    psikologs.value.push(response.data);
    closeAddModal();
  } catch (e) {
    console.error('Error adding psikolog:', e);
    error.value = 'Failed to add psikolog.';
  }
};


import { usePsikologStore } from "../stores/psikolog-store";

const psikologStore = usePsikologStore();

onMounted(async () => {
  try {
    await psikologStore.fetchPsikologs(); 
    psikologs.value = psikologStore.psikologs;
  } catch (e) {
    console.error("Failed to fetch psikolog data:", e);
    error.value = "Failed to load psikolog data.";
  } finally {
    loading.value = false;
  }
});

</script>


<style scoped>
.table {
  margin-top: 20px;
  width: 100%;
}

table th,
table td {
  vertical-align: middle;
  text-align: center;
  padding: 10px;
}

table th {
  background-color: #f8f9fa;
}

ul {
  list-style-type: none;
  padding-left: 0;
}

ul li {
  margin-bottom: 5px;
}

ul li strong {
  font-weight: bold;
}

/* Modal styling */
.modal.show {
  display: block;
}
</style>

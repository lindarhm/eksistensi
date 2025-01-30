import { defineStore } from 'pinia';
import axios from 'axios';

interface Psikolog {
  specialization: string;
  name: string;
  id: number;
  availableSlots: [];
  reviews: [];
  imgSrc: string;
}

export const usePsikologStore = defineStore('psikologStore', {
  state: () => ({
    psikologs: [] as Psikolog[],
    loading: false,
    error: '',
    selectedPsikolog: null as Psikolog | null,
  }),
  actions: {
    async fetchPsikologs() {
      this.loading = true;
      this.error = '';
      try {
        const response = await axios.get('get_psikolog_list_with_profile', {
          headers: { Authorization: `Bearer ${localStorage.getItem('token')}` },
        });

        if (response.data.status === 'success') {
          const psikologList = response.data.psikologs.psychologists.map((psychologist: any) => ({
            id: psychologist.id,
            name: psychologist.name,
            specialization: psychologist.specialization || '-',
            availableSlots: psychologist.availableSlots,
            reviews: psychologist.reviews || [],
            imgSrc: psychologist.imgSrc || '',
          }));
          this.psikologs = psikologList;
        } else {
          this.error = 'Gagal mengambil data psikolog.';
        }
      } catch (err) {
        this.error = err instanceof Error ? err.message : 'Terjadi kesalahan.';
      } finally {
        this.loading = false;
      }
    },
    async fetchPsikologsID(id: number) {
      this.loading = true;
      this.error = '';
      try {
        const response = await axios.get(`get_psikolog_list_with_profile/${id}`, {
          headers: { Authorization: `Bearer ${localStorage.getItem('token')}` },
        });
    
        if (response.data.status === 'success') {
          const psychologist = response.data.psikologs; // Asumsikan ini format response-nya
          this.psikologs = [
            {
              id: psychologist.id,
              name: psychologist.name,
              specialization: psychologist.specialization || '-',
              availableSlots: psychologist.availableSlots,
              reviews: psychologist.reviews || [],
              imgSrc: psychologist.imgSrc || '', // Tambahkan imgSrc jika diperlukan
            },
          ];
        } else {
          this.error = 'Gagal mengambil data psikolog.';
        }
      } catch (err) {
        this.error = err instanceof Error ? err.message : 'Terjadi kesalahan.';
      } finally {
        this.loading = false;
      }
    },    
    async savePsikolog(psikolog: {
      description: string;
      experience: string;
      name: string;
      offline_day: string;
      offline_hour: string;
      online_day: string;
      online_hour: string;
      profilepicture: string;
      rating: number;
      specialization: string;
    }) {
      this.loading = true;
      this.error = '';
      try {
        const response = await axios.post('save_psikolog', psikolog, {
          headers: { Authorization: `Bearer ${localStorage.getItem('token')}` },
        });
    
        if (response.data.status === 'success') {
          this.psikologs.push({
            id: response.data.id, // ID dari response API
            name: psikolog.name,
            specialization: psikolog.specialization,
            availableSlots: [], // Default value
            reviews: [],        // Default value
            imgSrc: psikolog.profilepicture || '', // Default value
          });
        } else {
          this.error = 'Gagal menyimpan data psikolog.';
        }
      } catch (err) {
        this.error = err instanceof Error ? err.message : 'Terjadi kesalahan.';
      } finally {
        this.loading = false;
      }
    },    
    async updatePsikolog(
      id: number,
      updatedPsikolog: {
        description?: string;
        experience?: string;
        name?: string;
        offline_day?: string;
        offline_hour?: string;
        online_day?: string;
        online_hour?: string;
        profilepicture?: string;
        rating?: number;
        specialization?: string;
      }
    ) {
      this.loading = true;
      this.error = '';
      try {
        const response = await axios.put(`update_psikolog/${id}`, updatedPsikolog, {
          headers: { Authorization: `Bearer ${localStorage.getItem('token')}` },
        });
    
        if (response.data.status === 'success') {
          const index = this.psikologs.findIndex((p) => p.id === id);
          if (index !== -1) {
            this.psikologs[index] = { ...this.psikologs[index], ...updatedPsikolog };
          }
        } else {
          this.error = 'Gagal memperbarui data psikolog.';
        }
      } catch (err) {
        this.error = err instanceof Error ? err.message : 'Terjadi kesalahan.';
      } finally {
        this.loading = false;
      }
    },    
    setSelectedPsikolog(psikolog :Psikolog) {
      this.selectedPsikolog = psikolog; 
    },
    resetSelectedPsikolog() {
      this.selectedPsikolog = null;
    },
  },
  getters: {
    getAllPsikologs: (state) => state.psikologs,
    getSelectedPsikolog: (state) => state.selectedPsikolog,  // Getter untuk selectedPsikolog
  },
});

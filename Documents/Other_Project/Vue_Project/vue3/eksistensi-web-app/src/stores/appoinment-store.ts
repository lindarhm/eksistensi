import { defineStore } from 'pinia';
import axios from 'axios';

export const useAppointmentStore = defineStore('appointment', {
  state: () => ({
    appointment: {
      date: '',
      time: '',
      psychologistId: 0, 
      userId: 123,
      transaction: {
        accountNumber: '1234567890', 
        status: 'pending', 
        type: 'transfer', 
      },
    },
    uploadedFile: null as File | null, // Proof of payment file
  }),
  actions: {
    // Set appointment details
    setAppointmentDetails(details: { date: string; time: string; psychologistId: number | null }) {
      this.appointment.date = details.date;
      this.appointment.time = details.time;
      // Ensure psychologistId is never null
      this.appointment.psychologistId = details.psychologistId ?? 0;
    },

    // Set uploaded payment file
    setUploadedFile(file: File) {
      this.uploadedFile = file;
    },

    // Submit payment data
    async submitPayment() {
      if (!this.uploadedFile) {
        throw new Error('Bukti pembayaran belum diunggah!');
      }

      // Get the token from localStorage
      const token = localStorage.getItem('token');
      if (!token) {
        throw new Error('Token tidak ditemukan! Silakan login ulang.');
      }

      // Ensure psychologistId is set to 0 if null or undefined
      const appointmentData = { ...this.appointment };
      if (appointmentData.psychologistId === null || appointmentData.psychologistId === undefined) {
        appointmentData.psychologistId = 0; // Set to default value 0
      }

      // Prepare the data to be sent
      const formData = new FormData();
      formData.append('file', this.uploadedFile);
      formData.append('appointment', JSON.stringify(appointmentData)); // Include all appointment and transaction data

      try {
        const response = await axios.post('book_appointment', formData, {
          headers: {
            'Content-Type': 'multipart/form-data',
            Authorization: `Bearer ${token}`, // Include token in the header
          },
        });
        return response.data;
      } catch (error) {
        console.error('Error saat mengirim data:', error);
        throw new Error('Gagal mengirim data ke server.');
      }
    },
  },
});

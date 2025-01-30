<template>
  <LandingComponent>
    <HeaderComponent />
    <div class="container transaction-history">
      <h3 class="text-center mb-4">Riwayat Transaksi</h3>

      <!-- Cek apakah ada transaksi -->
      <!-- <div v-if="transactionStore.transactions.length > 0"> -->
        <div v-for="transaction in transactionStore.transactions" :key="transaction.id" class="transaction-card mb-4">
          <h5>Konsultasi Offline</h5>
          <p><strong>Janji Konsultasi:</strong> {{ formatDateTime(transaction.date, transaction.time) }}</p>
          <div class="transaction-footer">
            <p><strong>Total:</strong> 300.000</p>
            <button @click="reschedule(transaction.id)" class="btn btn-primary">Jadwalkan Ulang</button>
          </div>
        </div>
      </div>
<!-- 
      <p v-else class="text-center">Belum ada riwayat transaksi.</p>
    </div> -->
  </LandingComponent>
</template>

<script setup lang="ts">
import HeaderComponent from '../components/header-component.vue';
import LandingComponent from '../components/landing-component.vue';
import { useTransactionStore } from '../stores/transaction-store';

const transactionStore = useTransactionStore();


transactionStore.fetchTransactions();


// Fungsi untuk format tanggal dan waktu
function formatDateTime(date: string, time: string): string {
  return `${new Date(date).toLocaleDateString('id-ID')} | ${time}`;
}

// Fungsi untuk jadwal ulang (contoh)
function reschedule(id: string) {
  console.log(`Rescheduling transaction with ID: ${id}`);
}
</script>

<style scoped>
.transaction-history {
  padding: 20px;
}

.transaction-card {
  padding: 20px;
  background-color: #d7eaff;
  border-radius: 8px;
  border: 1px solid #007bff;
}

.transaction-card h5 {
  margin-top: 0;
}

.transaction-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 20px;
}

button {
  padding: 10px 20px;
  border-radius: 5px;
}
</style>

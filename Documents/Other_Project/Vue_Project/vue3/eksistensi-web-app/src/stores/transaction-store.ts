import { defineStore } from 'pinia';
import axios from 'axios';

interface Transaction {
  date: string;
  id: string;
  psychologistName: string;
  status: string;
  time: string;
}

interface State {
  transactions: Transaction[];
}

export const useTransactionStore = defineStore('transactionStore', {
  state: (): State => ({
    transactions: [],
  }),
  actions: {
    async fetchTransactions() {
      try {
        const token = localStorage.getItem('token');
        if (!token) {
          throw new Error('No token found in localStorage');
        }

        // Panggil API menggunakan axios
        const response = await axios.get('get_transaction_history', {
          headers: {
            'Content-Type': 'application/json',
            Authorization: `Bearer ${token}`,
          },
        });

        // Dapatkan data dari respons
        const data = response.data;

        if (data.status === 'success' && Array.isArray(data.transactions)) {
          this.transactions = data.transactions;
          console.log('Transactions fetched successfully:', this.transactions);
        } else {
          console.error('Unexpected response structure:', data);
        }
      } catch (error) {
        if (axios.isAxiosError(error)) {
          console.error('Axios error:', error.message);
          if (error.response) {
            console.error('Response data:', error.response.data);
            console.error('Response status:', error.response.status);
          }
        } else if (error instanceof Error) {
          console.error('General error:', error.message);
        } else {
          console.error('Unknown error:', error);
        }
      }
      
    },
  },
});

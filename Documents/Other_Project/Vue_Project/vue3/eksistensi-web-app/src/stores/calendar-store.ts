// src/stores/calendarStore.ts
import { defineStore } from 'pinia';
import axios from 'axios';

interface Psychologist {
  name: string;
  time: string;
}

interface CalendarItem {
  date: string;
  psychologists: Psychologist[];
}

export const useCalendarStore = defineStore({
  id: 'calendar',
  state: () => ({
    calendarData: [] as CalendarItem[],
  }),
  actions: {
    async fetchCalendar() {
      try {
        const response = await axios.get('calendar');
        this.calendarData = response.data.calendar;
      } catch (error) {
        console.error('Error fetching calendar data:', error);
      }
    },
  },
});

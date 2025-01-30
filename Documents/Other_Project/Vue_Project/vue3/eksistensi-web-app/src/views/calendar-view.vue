<template>
    <LandingComponent>
        <HeaderComponent/>
    <div class="calendar-container">
      <h2 class="calendar-title">Psychologist Schedule</h2>
      <div class="calendar-grid">
        <div v-for="item in calendarData" :key="item.date" class="calendar-column">
          <div class="date-header">{{ formatDate(item.date) }}</div>
          <div
            v-for="psychologist in item.psychologists"
            :key="psychologist.time"
            class="calendar-event"
          >
            <span class="event-time">{{ psychologist.time }}</span>
            <span class="event-name">{{ psychologist.name }}</span>
          </div>
        </div>
      </div>
    </div>
</LandingComponent>
  </template>
  
  <script setup lang="ts">
  import { ref, onMounted } from 'vue';
  import { useCalendarStore } from '../stores/calendar-store';
  import LandingComponent from '../components/landing-component.vue';
import HeaderComponent from '../components/header-component.vue';
  
  interface Psychologist {
    name: string;
    time: string;
  }
  
  interface CalendarItem {
    date: string;
    psychologists: Psychologist[];
  }
  
  const calendarStore = useCalendarStore();
  const calendarData = ref<CalendarItem[]>([]);
  
  onMounted(async () => {
    await calendarStore.fetchCalendar();
    calendarData.value = calendarStore.calendarData;
  });
  
  const formatDate = (dateString: string) => {
    const options: Intl.DateTimeFormatOptions = { 
      weekday: 'short', month: 'short', day: 'numeric' 
    };
    const date = new Date(dateString);
    return date.toLocaleDateString('en-US', options);
  };
  </script>
  
  <style scoped>
  .calendar-container {
    padding: 20px;
    background: #f9f9f9;
  }
  .calendar-title {
    text-align: center;
    margin-bottom: 20px;
  }
  .calendar-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
    gap: 10px;
  }
  .calendar-column {
    background: #fff;
    border-radius: 8px;
    padding: 10px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  }
  .date-header {
    font-weight: bold;
    text-align: center;
    margin-bottom: 10px;
  }
  .calendar-event {
    background: #4a90e2;
    color: white;
    padding: 8px;
    margin-bottom: 5px;
    border-radius: 5px;
    text-align: center;
  }
  .event-time {
    font-weight: bold;
    display: block;
  }
  .event-name {
    font-size: 0.9em;
  }
  </style>
  
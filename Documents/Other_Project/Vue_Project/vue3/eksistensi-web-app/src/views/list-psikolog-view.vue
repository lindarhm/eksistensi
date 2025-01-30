<template>
  <LandingComponent>
    <HeaderComponent />
    <div class="container my-4">
      <h3 class="text-center mb-4">Daftar Psikolog</h3>
      <div v-if="psikologStore.loading" class="text-center">Loading...</div>
      <div v-else-if="psikologStore.error" class="text-danger text-center">{{ psikologStore.error }}</div>
      <div v-else class="row row-cols-1 row-cols-md-3 g-4">
        <div class="col" v-for="psikolog in psikologStore.psikologs" :key="psikolog.id" @click="sendDetail(psikolog)"
          style="cursor: pointer">
          <PsikologCard :psikolog="psikolog" />
        </div>
      </div>
    </div>
  </LandingComponent>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router';
import { usePsikologStore } from '../stores/psikolog-store';
import PsikologCard from '../components/card-component.vue';
import HeaderComponent from '../components/header-component.vue';
import LandingComponent from '../components/landing-component.vue';

    const psikologStore = usePsikologStore();
    const router = useRouter();

    const sendDetail = (psikolog: any) => {
      console.log("PSIKOLOG => " + JSON.stringify(psikolog)
      )
      psikologStore.setSelectedPsikolog(psikolog);
      router.push({
        name: 'PsikologDetail',
        params: { id: psikolog.id },
      });
    };

  psikologStore.fetchPsikologs()
</script>


<style scoped>
.p-3 {
  background-color: #f8f9fa;
  transition: transform 0.2s ease-in-out;
}

.p-3:hover {
  transform: scale(1.05);
}
</style>

<template>
  <LandingComponent>
    <HeaderComponent />
    <section class="landing-section mt-4">
    <div class="container">
      <div class="row align-items-center">

        <div class="col-md-6">
          <h3 class="fw-bold text-primary text-start custom-size">
            Hidup Lebih Bahagia dengan Solusi Kesehatan Mental Terbaik
          </h3>
          <p class="fs-10 mb-4 text-start mt-4">
            Butuh ruang aman untuk berkonsultasi? Psikolog profesional kami siap membantu Anda menghadapi segala masalah kapan saja dan di mana saja. Dapatkan dukungan penuh untuk mewujudkan kesejahteraan mental dan hidup yang lebih seimbang.
          </p>
          <div class="mb-4 text-start">
          <button class="btn btn-lg btn-custom">Mulai Konseling</button>
        </div>

        <div class="row text-center">
          <div class="col-6 col-md-6 text-start" v-for="(feature, index) in features.slice(0, 4)" :key="index">
        <div class="mb-3">
          <i :class="feature.iconClass" class="fs-1 text-primary"></i>
        </div>
          <h5 class="mb-0">{{ feature.value }}</h5>
          <small>{{ feature.label }}</small>
        </div>
        </div>
        </div>

        <div class="col-md-6 text-center">
          <img src="../assets/images/img-home.png" alt="Counseling Illustration" class="img-fluid" />
        </div>

      </div>

    <!-- <hr class="my-5" />

    <div class="testimonial-container">
      <h2 class="fw-bold mb-4 text-center">Apa Yang Mereka Katakan</h2>
      <div class="d-flex justify-content-between align-items-center">
        <button class="btn btn-outline-secondary me-3" @click="prevSlide">Left</button>
        <div class="d-flex overflow-auto">
          <div
            class="card mx-2"
            v-for="(testimonial, index) in testimonials"
            :key="index"
            style="min-width: 18rem;"
          >
            <div class="card-body text-center">
              <img
                :src="testimonial.image"
                :alt="testimonial.name"
                class="rounded-circle mb-3"
                style="width: 80px; height: 80px;"
              />
              <h5 class="card-title">{{ testimonial.name }}</h5>
              <p class="card-text">“{{ testimonial.comment }}”</p>
              <small class="text-muted">Rating: {{ testimonial.rating }}/5</small>
            </div>
          </div>
        </div>
        <button class="btn btn-outline-secondary ms-3" @click="nextSlide">Right</button>
      </div>
    </div> -->
  </div>
</section>
</LandingComponent>
</template>



<script setup lang="ts">
// import FeatureItem from '@/components/FeatureItem.vue';
// import TestimonialCard from '@/components/TestimonialCard.vue';
import HeaderComponent from '../components/header-component.vue';
import LandingComponent from '../components/landing-component.vue';
// const testimonials = ref([
//   {
//     name: "A, 24 Tahun",
//     rating: 5.0,
//     image: "path_to_image",
//     comment: "Komentar testimonial yang sangat baik"
//   },
// ]);

const features = [
      { iconClass: 'bi bi-heart-fill', value: '22%', label: 'Peningkatan Kebahagiaan' },
      { iconClass: 'bi bi-people-fill', value: '900,000+', label: 'Pengguna Percaya' },
      { iconClass: 'bi bi-person-check-fill', value: '100+', label: 'Psikolog Terlatih' },
      { iconClass: 'bi bi-star-fill', value: '4.7/5', label: 'Rating Pengguna' },
    ];
// const nextSlide = () => {
//   // Implement the logic for next slide
// };

// const prevSlide = () => {
//   // Implement the logic for previous slide
// };
</script>

<style scoped>
.section-line {
  border-top: 1px solid #e5e7eb;
}
.custom-size {
  font-size: 2rem;
}
.custom-margin {
  margin-top: 5px; 
}
.text-primary {
  color: #3B7EE1 !important;
}
.btn-custom {
  background-color: #FFEBA9; 
  color: #000;
  border-radius: 30px; 
  border: none; 
  padding: 13px 20px; 
  font-size: 16px;
  transition: background-color 0.3s ease;
}
.btn-custom:hover {
  background-color: #FFD97D; 
}
.row.text-center > .col-6 {
  padding: 10px;
}

</style>
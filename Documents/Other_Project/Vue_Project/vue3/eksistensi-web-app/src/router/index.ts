import { createRouter, createWebHistory } from 'vue-router'
import DashboardView from '../views/dashboard-view.vue'
import ListPsikologView from '../views/list-psikolog-view.vue'
import RegisterUserView from '../views/register-user-view.vue'
import DetailPsikologView from '../views/detail-psikolog-view.vue'
import LoginUserView from '../views/login-user-view.vue'
import HistoryUserView from '../views/history-user-view.vue'
import PsikologAdminView from '../views/psikolog-admin-view.vue'
import UserProfileView from '../views/user-profile-view.vue'
import HistoryAdminView from '../views/history-admin-view.vue'
import CalendarView from '../views/calendar-view.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/dashboard',
      name: 'dashboard',
      component: DashboardView
    },
    {
      path: '/psikolog-list',
      name: 'psikolog-list',
      component: ListPsikologView
    },
    {
      path: '/register',
      name: 'register',
      component: RegisterUserView
    },
    {
      path: '/login',
      name: 'login',
      component: LoginUserView
    },
    {
      path: '/detail-psikolog/:id',
      name: 'detail-psikolog',
      component: DetailPsikologView
    },
    {
      path: '/history-user',
      name: 'history-user',
      component: HistoryUserView
    },
    {
      path: '/history-admin',
      name: 'history-admin',
      component: HistoryAdminView
    },
    {
      path: '/psikolog-list-admin',
      name: 'psikolog-list-admin',
      component: PsikologAdminView
    },
    {
      path: '/profile',
      name: 'profile',
      component: UserProfileView
    },
    {
      path: '/calendar',
      name: 'calendar',
      component: CalendarView
    }
  ]
})

import { RouteLocationNormalized, NavigationGuardNext } from 'vue-router';

router.beforeEach((to: RouteLocationNormalized, from: RouteLocationNormalized, next: NavigationGuardNext) => {
  const token = localStorage.getItem('token');
  console.log('Navigating from:', from.name);  // Example usage of `from`
  console.log('Checking token in beforeEach:', token); // Debugging log

  if (to.name !== 'login' && !token) {
    console.log('Token not found, redirecting to login...');
    next({ name: 'login' }); // Redirect to login if no token
  } else {
    console.log('Token found, proceeding to:', to.name);
    next(); // Allow navigation
  }
});




export default router;

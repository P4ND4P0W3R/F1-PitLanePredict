import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import DriversView from '../views/DriversView.vue'
import TeamsView from '../views/TeamsView.vue'
import RacesView from '../views/RacesView.vue'
import DriverDetails from '../views/DriverDetailsView.vue'
import TeamDetails from '../views/TeamDetailsView.vue'
import Login from '../views/LoginView.vue';
import Register from '../views/RegisterView.vue';

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: HomeView,
    },
    {
      path: "/drivers",
      name: "drivers",
      component: DriversView,
    },
    {
      path: "/teams",
      name: "teams",
      component: TeamsView,
    },
    {
      path: "/races",
      name: "races",
      component: RacesView,
    },
    {
      path: '/driver/:driverId',
      name: 'driver-details',
      component: DriverDetails,
    },
    {
      path: '/team/:constructorId',
      name: 'team-details',
      component: TeamDetails,
    },
    {
      path: '/login',
      name: 'login',
      component: Login,
    },
    {
      path: '/register',
      name:'register',
      component: Register,
    },
    {
      path: "/about",
      name: "about",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import("../views/AboutView.vue"),
    },
    {
      path: '/:catchAll(.*)',
      name: 'not-found',
      component: () => import('../views/NotFoundView.vue'),
    }

  ],
});

export default router;

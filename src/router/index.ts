import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: () => import("../views/HomeView.vue")
    },
    {
      path: "/drivers",
      name: "drivers",
      component: () => import("../views/DriversView.vue")
    },
    {
      path: "/teams",
      name: "teams",
      component: () => import("../views/TeamsView.vue")
    },
    {
      path: "/races",
      name: "races",
      component: () => import("../views/RacesView.vue")
    },
    {
      path: '/driver/:driverId',
      name: 'driver-details',
      component: () => import("../views/DriverDetailsView.vue")
    },
    {
      path: '/team/:constructorId',
      name: 'team-details',
      component: () => import("../views/TeamDetailsView.vue")
    },
    {
      path: '/login',
      name: 'login',
      component: () => import("../views/LoginView.vue"),
    },
    {
      path: '/register',
      name:'register',
      component: () => import("../views/RegisterView.vue"),
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

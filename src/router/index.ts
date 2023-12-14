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
      path: '/team/:teamId',
      name: 'team-details',
      component: () => import("../views/TeamDetailsView.vue")
    },
    {
      path: '/race/:raceId',
      name: 'race-details',
      component: () => import("../views/RaceResultsView.vue")
    },
    {
      path: '/login',
      name: 'login',
      component: () => import("../views/LoginView.vue"),
    },
    {
      path: '/register',
      name: 'register',
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
    },
    {
      path: '/create-driver',
      name: 'create-driver',
      component: () => import('../views/CreateDriverView.vue'),
      meta: {
        requiresAuth: true, // Optional: You can use this meta field to check authentication before displaying the form
      },
    },
    {
      path: '/delete-driver',
      name: 'delete-driver',
      component: () => import('../views/DeleteDriverView.vue'),
      meta: {
        requiresAuth: true, // Optional: You can use this meta field to check authentication before displaying the form
      },
    },
    {
      path: '/update-driver',
      name: 'update-driver',
      component: () => import('../views/UpdateDriverView.vue'),
      meta: {
        requiresAuth: true, // Optional: You can use this meta field to check authentication before displaying the form
      },
    },
    {
      path: '/create-team',
      name: 'create-team',
      component: () => import('../views/CreateTeamView.vue'),
      meta: {
        requiresAuth: true, // Optional: You can use this meta field to check authentication before displaying the form
      },
    },
    {
      path: '/delete-team',
      name: 'delete-team',
      component: () => import('../views/DeleteTeamView.vue'),
      meta: {
        requiresAuth: true, // Optional: You can use this meta field to check authentication before displaying the form
      },
    },
    {
      path: '/update-team',
      name: 'update-team',
      component: () => import('../views/UpdateTeamView.vue'),
      meta: {
        requiresAuth: true, // Optional: You can use this meta field to check authentication before displaying the form
      },
    },
    {
      path: '/create-race',
      name: 'create-race',
      component: () => import('../views/CreateRaceView.vue'),
      meta: {
        requiresAuth: true, // Optional: You can use this meta field to check authentication before displaying the form
      },
    },
    {
      path: '/delete-race',
      name: 'delete-race',
      component: () => import('../views/DeleteRaceView.vue'),
      meta: {
        requiresAuth: true, // Optional: You can use this meta field to check authentication before displaying the form
      },
    },
    {
      path: '/update-race',
      name: 'update-race',
      component: () => import('../views/UpdateRaceView.vue'),
      meta: {
        requiresAuth: true, // Optional: You can use this meta field to check authentication before displaying the form
      },
    },
  ],
});

export default router;

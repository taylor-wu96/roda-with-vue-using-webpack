import { createRouter, createMemoryHistory, createWebHistory } from 'vue-router';
import Home from '../pages/HomePage.vue';
import About from '../pages/AboutPage.vue';


const isServer = typeof window === 'undefined';
const history = isServer ? createMemoryHistory() : createWebHistory();
const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
  },
  {
    path: '/about',
    name: 'About',
    component: About,
  },
];

const router = createRouter({
  history,
  routes,
});

export default router;

import { createRouter, createWebHistory } from 'vue-router';
import Pools from '../views/PoolList.vue';
import Create from '../views/Create.vue';
import Faucet from '../views/Faucet.vue';

const routes = [{
  path: '/',
  name: 'Pools',
  component: Pools
},
{
  path: '/create',
  name: 'create',
  component: Create
},
{
  path: '/faucet',
  name: 'faucet',
  component: Faucet
}
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
});

export default router;

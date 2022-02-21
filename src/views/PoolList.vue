<template>
  <div class="flex flex-col">
    <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
      <div class="inline-block py-2 min-w-full sm:px-6 lg:px-8">
        <div class="overflow-hidden shadow-md sm:rounded-lg">
          <table class="min-w-full">
            <thead class="bg-gray-50 dark:bg-gray-700">
              <tr>
                <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">Pool Address</th>
                <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">Raise Token</th>
                <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">Raise Amount</th>
                <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">Filled</th>
                <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">Price per token</th>
                <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">State</th>
                <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-right text-gray-700 uppercase dark:text-gray-400">Operation</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="pool in pools" :key="pool.contractAddress" class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                <td class="py-2 px-6 text-sm font-medium text-gray-900 whitespace-nowrap dark:text-white cursor-pointer items-center">
                  <span @click="onPoolDetail(pool)"> {{ formatAddress(pool[0]) }}</span>
                </td>
                <td class="py-2 px-6 text-sm text-gray-500 whitespace-nowrap dark:text-gray-400">
                  <div class="flex flex-row items-center">
                    <img :src="getTokenImg(pool.buyToken)" class="h-8" style="" /> <span class="ml-2">{{ tokenName(pool.buyToken) }}</span>
                  </div>
                </td>
                <td class="py-2 px-6 text-sm text-gray-500 whitespace-nowrap dark:text-gray-400">{{ pool.raiseAmount / 10 ** 18 }}</td>
                <td class="py-2 px-6 text-sm text-gray-500 whitespace-nowrap dark:text-gray-400">{{ pool.filled / 10 ** 18 }}</td>
                <td class="py-2 px-6 text-sm text-gray-500 whitespace-nowrap dark:text-gray-400">{{ pool.price / 10000 }} USDC</td>

                <td class="px-6 text-sm text-gray-500 whitespace-nowrap dark:text-gray-400">
                  <div class="flex flex-row items-center">
                    <div>{{ state(pool.endTime) }}</div>
                    <div v-if="pool.endTime >= new Date().getTime() / 1000" class="ml-2 h-3 w-3 rounded-lg bg-green-300"></div>
                    <div v-else class="ml-2 h-3 w-3 rounded-lg bg-gray-300"></div>
                  </div>
                </td>
                <td class="py-2 px-6 text-sm font-medium text-right whitespace-nowrap">
                  <a href="#" class="text-gray-600 hover:text-gray-900 dark:text-gray-500 dark:hover:underline font-semibold" v-if="pool.endTime >= new Date().getTime() / 1000" @click="swap(pool)">Swap </a>
                  <a href="#" class="text-gray-600 hover:text-gray-900 dark:text-gray-500 dark:hover:underline font-semibold" v-if="pool.endTime < new Date().getTime() / 1000" @click="withdraw(pool[0])">Withdraw </a>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <PoolDetailModal v-if="showModal" @close="showModal = false" :pool="selectedPool" />
  <SwapModal v-if="showSwap" @close="showSwap = false" :pool="selectedPool" />
</template>

<script>
import factory from '../utils/factory'
import UseWallet from '../utils/wallet'
const { connect, web3, walletGlobal } = UseWallet()
import ExchangePool from '../assets/ExchangePool.json'
import PoolDetailModal from '../components/PoolDetailModal'
import SwapModal from '../components/SwapModal'
import { getSwapInfos } from '../utils/pool.js'
import { getTokenMeta } from '../utils/util.js'

export default {
  name: 'PoolList',
  components: { PoolDetailModal, SwapModal },
  data() {
    return {
      pools: [],
      showModal: false,
      showSwap: false,
      selectedPoolAddress: '',
      token: '',
      selectedPool: null,
    }
  },
  computed: {},
  methods: {
    getTokenImg(contractAddress) {
      let tokenMeta = getTokenMeta(contractAddress)
      return tokenMeta.img
    },
    tokenName(contractAddress) {
      let tokenMeta = getTokenMeta(contractAddress)
      return tokenMeta.token
    },
    state(endTime) {
      return endTime >= new Date().getTime() / 1000 ? 'Active' : 'Ended'
    },
    swap(pool) {
      console.log('swap', pool)
      this.selectedPool = pool
      this.showSwap = true
    },
    async withdraw(poolAddress) {
      console.log('withdraw', poolAddress)
      let pool = new web3.eth.Contract(ExchangePool.abi, poolAddress)
      await pool.methods.withdraw().send({
        from: walletGlobal.account,
        // value: web3.utils.toWei('10', 'ether'),
      })
      console.log('withdraw done')
      this.$toast.show(`withdraw done`, {
        position: 'top',
        duration: 2000,
      })
    },
    async getBal(poolAddress) {
      let pool = new web3.eth.Contract(ExchangePool.abi, poolAddress)
      pool.methods
        .getBalance()
        .call()
        .then((res) => console.log(res))
    },
    formatAddress(val) {
      return val.substring(0, 6) + '...' + val.substring(val.length - 4, val.length)
    },
    onPoolDetail(pool) {
      console.log('onPoolDetail():', pool)
      this.selectedPool = pool
      this.showModal = true
    },
    async participate(poolAddress) {
      return false
    },
  },
  async created() {
    factory.methods
      .getPools()
      .call()
      .then((res) => {
        res[0].map(async (pool) => {
          let pool_ = {}
          Object.assign(pool_, pool)
          let swapInfos = await getSwapInfos(pool.contractAddress)
          let filled = 0
          swapInfos[0].map((info) => {
            filled = filled + parseInt(info.amount, 10)
          })
          Object.assign(pool_, { filled })
          console.log(pool_)
          this.pools.push(pool_)
        })
      })
  },
}
</script>

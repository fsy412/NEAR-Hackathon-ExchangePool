<template>
  <div>
    <div v-if="showModal" class="overflow-x-hidden overflow-y-auto fixed inset-10 z-50 outline-none focus:outline-none justify-center items-center flex">
      <div class="relative w-auto my-6 mx-auto max-w-xl" style="width: 800px">
        <!--content-->
        <div class="border-0 rounded-lg shadow-lg relative flex flex-col w-full bg-white outline-none focus:outline-none">
          <!--header-->
          <div class="flex items-start justify-between pt-5 pb-3 px-5 border-b border-solid border-blueGray-200 rounded-t">
            <h3 class="text-3xl font-semibold">Pool Details</h3>
            <button class="px-1 ml-auto border-0 text-black float-right text-3xl leading-none font-semibold outline-none focus:outline-none" v-on:click="toggleModal()">
              <span class="justify-center items-center text-black h-6 w-6 text-2xl"> × </span>
            </button>
          </div>

          <!--body-->
          <div class="relative py-2 px-4 flex-auto">
            <div class="py-1">
              <div class="fs-container flex flex-row justify-between items-center min-w-full">
                <div class="fc-container flex flex-row items-center" style="width: 30%">
                  <img :src="tokenImg" style="width: 40%" />
                  <span class="ml-2">{{ tokenRaise }}</span>
                </div>
                <div class="flex flex-row justify-center" style="width: 70%">
                  <span class="ml-20" style=""> Creator: {{ formatAddress(creator) }}</span>
                  <!-- <span class="ml-10" style=""> Ended </span> -->
                </div>
              </div>
              <hr class="my-2" />
              <div class="fs-container mt-3 flex flex-row items-center min-w-full justify-between">
                <div class="flex flex-col">
                  <span class="value font-semibold"> {{ raiseAmount / 10 ** 18 }} {{ tokenRaise }} </span> <span class="text-xs"> Total Raise </span>
                </div>
                <div class="flex flex-col">
                  <span class="value font-semibold"> {{ perTokenPrice / 10000 }} {{ tokenSell }} </span> <span class="text-xs"> Per {{ tokenRaise }} </span>
                </div>
              </div>
              <div class="mt-2">
                <div>
                  <div class="ant-progress-outer">
                    <div class="ant-progress-bg h-1 bg-gray-300" style="width: 100%; height: 8px; border-radius: 100px"></div>
                  </div>
                  <div class="flex justify-end mt-2">
                    <span> 100% </span>
                  </div>
                </div>
              </div>
              <hr class="mt-1" />
            </div>
            <div class="text-gray-800 py-2 font-semibold">Swap Records</div>
            <table class="py-2 min-w-full">
              <thead class="pt-2 bg-gray-50 dark:bg-gray-700">
                <tr>
                  <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">Swapper Address</th>
                  <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">Amount</th>
                  <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">Time</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="rec in swapRecords" :key="rec.tx">
                  <td class="py-4 px-6 text-sm text-gray-500 whitespace-nowrap dark:text-gray-400">{{ formatAddress(rec.user) }}</td>
                  <td class="py-4 px-6 text-sm text-gray-500 whitespace-nowrap dark:text-gray-400">{{ rec.amount / 10 ** 18 }}</td>
                  <td class="py-4 px-6 text-sm text-gray-500 whitespace-nowrap dark:text-gray-400">{{ toDate(rec.time) }}</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <div v-if="showModal" class="opacity-25 fixed inset-0 z-40 bg-black"></div>
  </div>
</template>

<script>
import moment from 'moment'
import { getSwapInfos } from '../utils/pool.js'
import { getTokenMeta } from '../utils/util.js'

export default {
  name: 'PoolDetail',
  props: ['pool'],
  data() {
    return {
      showModal: true,
      swapRecords: null,
      tokenMeta: null,
      tokenRaise: '',
      tokenImg: '',
      raiseAmount: 0,
      tokenSell: '',
      perTokenPrice: 0,
      creator: '',
      filledPercent: 0,
    }
  },
  async mounted() {
    console.log('mounted()', this.pool)
    this.swapRecords = (await getSwapInfos(this.pool.contractAddress))[0]
    console.log(this.swapRecords)
    let tokenMeta = getTokenMeta(this.pool.buyToken)
    this.tokenRaise = tokenMeta.token
    this.tokenImg = tokenMeta.img
    tokenMeta = getTokenMeta(this.pool.sellToken)
    this.tokenSell = tokenMeta.token
    this.raiseAmount = this.pool.raiseAmount
    this.perTokenPrice = this.pool.price
    this.creator = this.pool.creator
    console.log('perTokenPrice:', this.perTokenPrice)
  },
  methods: {
    toggleModal: function () {
      this.$emit('close')
    },
    formatAddress(val) {
      return val.substring(0, 6) + '...' + val.substring(val.length - 4, val.length)
    },
    toDate(val) {
      console.log(val)
      return moment(val * 1000).format('MM/DD/YYYY hh:mm')
    },
  },
}
</script>

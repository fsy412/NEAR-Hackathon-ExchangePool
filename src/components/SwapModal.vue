<template>
  <div>
    <div v-if="showModal" class="overflow-x-hidden overflow-y-auto fixed inset-10 z-50 outline-none focus:outline-none justify-center items-center flex">
      <div class="relative w-auto my-6 mx-auto max-w-xl" style="width: 500px">
        <!--content-->
        <div class="border-0 rounded-lg shadow-lg relative flex flex-col w-full bg-white outline-none focus:outline-none">
          <!--header-->
          <div class="flex items-start justify-between p-5 border-blueGray-200 rounded-t">
            <h3 class="text-3xl font-semibold">Swap Token</h3>
            <button class="p-1 ml-auto border-0 text-black float-right text-3xl leading-none font-semibold outline-none focus:outline-none" @click="toggleModal()">
              <span class="justify-center items-center text-black h-6 w-6 text-2xl"> × </span>
            </button>
          </div>
          <!--body-->
          <div class="relative p-noe6 flex-auto">
            <div class="shadow sm:rounded-md sm:overflow-hidden">
              <div class="px-4 py-5 bg-white space-y-6 sm:p-6 justify-center items-center">
                <div class=" ">
                  <label for="company-website" class="block text-sm font-medium text-gray-700"> Pool available amount: {{ availableAmount }}</label>
                </div>
                <div class="justify-center items-center">
                  <div class="mt-1 flex items-center">
                    <div class="w-full">
                      <label for="customRange3" class="form-label text-gray-700">Amount {{ amount }}</label>
                      <input type="range" class="bg-gray-400 form-range appearance-none w-full h-1 p-0 bg-transparent focus:outline-none focus:ring-0 focus:shadow-none underline" min="0" :max="availableAmount" step="0.1" value="0.0" @input="onChange($event)" />
                    </div>
                  </div>
                </div>
              </div>
              <div class="px-4 py-6 bg-gray-50 text-right sm:px-6">
                <button class="w-full py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" @click="approveAndSwap()">
                  {{ bntTxt }}
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div v-if="showModal" class="opacity-25 fixed inset-0 z-40 bg-black"></div>
  </div>
</template>

<script>
import ExchangePool from '../assets/ExchangePool.json'
import ERC20 from '../assets/Token.json'
import UseWallet from '../utils/wallet'
const { connect, web3, walletGlobal } = UseWallet()

export default {
  name: 'swap-modal',
  props: ['pool'],
  data() {
    return {
      showModal: true,
      amount: 0,
      bntTxt: 'Approve',
      availableAmount: 0,
    }
  },
  mounted() {
    console.log('swapModal', this.pool.raiseAmount)
    console.log('filled', this.pool.filled)
    this.availableAmount = (this.pool.raiseAmount - this.pool.filled) / 10 ** 18
    console.log('availableAmount', this.availableAmount)
  },
  methods: {
    toggleModal() {
      this.$emit('close')
    },
    onChange(ev) {
      this.amount = ev.target.value
    },
    async approveAndSwap() {
      if (this.bntTxt == 'Approve') {
        console.log(`token ${this.pool.buyToken} approve pool:${this.pool.contractAddress}`)
        let token = new web3.eth.Contract(ERC20.abi, this.pool.buyToken)
        await token.methods.approve(this.pool.contractAddress, BigInt(this.amount * 1e18)).send({
          from: walletGlobal.account,
        })
        this.$toast.show(`approved`, {
          position: 'top',
          duration: 2000,
        })
        this.bntTxt = 'Swap'
      } else {
        let pool = new web3.eth.Contract(ExchangePool.abi, this.pool.contractAddress)
        await pool.methods.swapSell(BigInt(this.amount * 1e18)).send({
          from: walletGlobal.account,
        })
        console.log('swap done')
        this.$toast.show(`swap done`, {
          position: 'top',
          duration: 2000,
        })
      }
    },
  },
}
</script>

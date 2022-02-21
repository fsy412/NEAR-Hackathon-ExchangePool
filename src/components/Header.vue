<template>
  <nav class="border-b p-3 flex justify-between">
    <a href="#" class="flex ml-6">
      <div class="h-10 w-10" style="">
        <img src="../assets/logo.png" />
      </div>
      <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Exchange Pools</span>
    </a>

    <div class="flex mt-2 item-center mr-4 justify-items-center">
      <router-link to="/"><a class="mr-4 text-gray-600"> Pools </a></router-link>
      <div v-if="show">
        <router-link to="create"><a class="mr-4 text-gray-600"> Create </a></router-link>
        <router-link to="faucet"><a class="mr-4 text-gray-600"> Faucet </a></router-link>
      </div>
      <router-link to="">
        <a class="px-4 py-2 rounded mr-6 text-gray-600 hover:text-white hover:bg-gray-700" @click="onConnectWallet">{{ btnTxt }} </a></router-link
      >
    </div>
  </nav>
</template>

<script>
import UseWallet from '../utils/wallet'

const { connect, web3, walletGlobal } = UseWallet()
export default {
  data() {
    return {
      btnTxt: 'Connect To Wallet',
      show: false,
    }
  },
  components: {},
  methods: {
    async onConnectWallet() {
      await connect()
      console.log(walletGlobal.account)
      this.btnTxt = this.formatAddress(walletGlobal.account)
      console.log('onConnectWallet done ')
      this.show = true
    },
    formatAddress(val) {
      return val.substring(0, 6) + '...' + val.substring(val.length - 4, val.length)
    },
    tab(index) {
      this.num = index
    },
  },
}
</script>

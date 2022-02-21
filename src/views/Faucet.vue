<template>
  <div class="w-full">
    <div class="mt-2 flex flex-row items-center justify-center">
      <div class=" " style="width: 500px;">
        <input v-model="tokenAddress" class="m-auto py-2 px-10 w-full border text-gray-800 border-gray-200 bg-white" placeholder="Input the token address" />
      </div>
      <div class="ml-2" style="width: 200px;">
        <DropSelect :tokenList="tokenList" v-model="selectedWrestler" v-on:valueSelect="onValueSelect"> </DropSelect>
      </div>
      <div>
        <button class="ml-2 py-2 px-3 bg-gray-200 text-gray-800 p-1 rounded" @click="onGiveToken">Give me token</button>
      </div>
    </div>
  </div>
</template>

<script>
import ERC20 from '../assets/Token.json'
import UseWallet from '../utils/wallet'
import DropSelect from '../components/DropSelect'
import { tokenList } from '../utils/util.js'
import { getBalance } from '../utils/erc20.js'

const { connect, web3, walletGlobal } = UseWallet()
export default {
  components: {
    DropSelect,
  },
  data() {
    return {
      isVisible: false,
      tokenAddress: '',
      selected: '',
      selectedToken: 'USDC',
      selectedTokenAddress: '',
      tokenList: tokenList,
    }
  },
  mounted() {
    tokenList.map(async (token) => {
      let bal = await getBalance(token.contractAddress, walletGlobal.account)
      console.log('get token balance:', token.token, bal)
    })
  },
  methods: {
    onValueSelect(value) {
      console.log('onValueSelect', value)
      this.selectedToken = value
      this.tokenList.map((v) => {
        if (v.token == value) {
          this.selectedTokenAddress = v.contractAddress
          this.tokenAddress = v.contractAddress
        }
      })
    },
    async onGiveToken() {
      console.log('token address ', this.tokenAddress)
      console.log('selected', this.selected)
      if (this.tokenAddress == '') {
        this.$toast.show(`Token address empty`, {
          position: 'top',
          duration: 2000,
        })
        return
      }
      let token = new web3.eth.Contract(ERC20.abi, this.tokenAddress)
      console.log(token.methods)
      await token.methods.faucet().send({
        from: walletGlobal.account,
      })
      this.$toast.show(`Token minted`, {
        position: 'top',
        duration: 2000,
      })
    },
  },
}
</script>

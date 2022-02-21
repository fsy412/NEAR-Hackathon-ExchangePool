<template>
  <div class="bg-grey-lighter flex flex-col mt-6">
    <div class="container w-1/2 mx-auto flex flex-col items-center justify-center px-2">
      <div class="bg-gray-50 px-6 py-6 rounded shadow-md text-black w-full">
        <h1 class="mb-5 text-2xl text-gray-500">Create Pool</h1>
        <div class="flex flex-row justify-between">
          <div class="w-full pr-2"><DropSelect class="mt-2" :tokenList="baseTokenList" v-model="baseToken" @valueSelect="onSelectBase"> </DropSelect></div>
          <div class="w-full"><DropSelect class="mt-2" :tokenList="quoteTokenList" v-model="quoteToken" @valueSelect="onSelectQuote"> </DropSelect></div>
        </div>
        <div class="flex flex-row justify-between mt-4">
          <div class="w-full pr-2"><input type="number" class="block border border-grey-light w-full p-1.5 rounded mb-4" placeholder="Raise amount" ref="raiseAmount" /></div>
          <div class="w-full"><input type="number" class="block border border-grey-light w-full p-1.5 rounded mb-4" placeholder="Price" ref="price" /></div>
        </div>
        <div class="flex flex-row justify-center items-center">
          <div class="flex mt-2 mb-5 items-center">
            <div class="tracking-wide text-gray-700 text-xs font-bold text-center" for="grid-city">Start Time</div>

            <div class="flex">
              <div class="px-2">
                <input class="appearance-none h-2 w-full text-gray-700 border border-grey-light rounded text-sm leading-tight focus:outline-none focus:bg-white focus:border-gray-500s" type="number" placeholder="H" id="startH" @input="onChange($event)" />
              </div>
              <div class="px-2">
                <input class="appearance-none h-2 w-full text-gray-700 border border-grey-light rounded text-sm leading-tight focus:outline-none focus:bg-white focus:border-gray-500" type="number" placeholder="M" id="startM" @input="onChange($event)" />
              </div>
              <div class="px-2">
                <input class="appearance-none h-2 w-full text-gray-700 border border-grey-light rounded text-sm leading-tight focus:outline-none focus:bg-white focus:border-gray-500" type="number" placeholder="S" id="startS" @input="onChange($event)" />
              </div>
            </div>
          </div>
          <div class="flex mt-2 mb-5 items-center">
            <div class="tracking-wide text-gray-700 text-xs font-bold text-center" for="grid-city">Duration</div>
            <div class="flex">
              <div class="px-2">
                <input class="appearance-none h-2 w-full text-gray-700 border border-grey-light rounded text-sm leading-tight focus:outline-none focus:bg-white focus:border-gray-500s" type="number" placeholder="H" id="durationH" @input="onChange($event)" />
              </div>
              <div class="px-2">
                <input class="appearance-none h-2 w-full text-gray-700 border border-grey-light rounded text-sm leading-tight focus:outline-none focus:bg-white focus:border-gray-500" type="number" placeholder="M" id="durationM" @input="onChange($event)" />
              </div>
              <div class="px-2">
                <input class="appearance-none h-2 w-full text-gray-700 border border-grey-light rounded text-sm leading-tight focus:outline-none focus:bg-white focus:border-gray-500" type="number" placeholder="S" id="durationS" @input="onChange($event)" />
              </div>
            </div>
          </div>
        </div>
        <button class="w-60 text-center py-2 rounded text-gray-500 bg-gray-200 hover:text-gray-700 hover:bg-blue-30" @click="createAndApprove()">{{ btnTxt }}</button>
        <span class="ml-1"> {{ poolAddress }}</span>
      </div>
    </div>
  </div>
</template>

<script>
import factory from '../utils/factory'
import UseWallet from '../utils/wallet'
import { CONFIG } from '../config'
import ERC20 from '../assets/Token.json'
import DropSelect from '../components/DropSelect'
import { tokenList, getTokenMetaByName } from '../utils/util.js'

const { connect, web3, walletGlobal } = UseWallet()

export default {
  components: {
    DropSelect,
  },
  data() {
    return {
      isVisible: false,
      btnTxt: 'Create',
      poolAddress: '',
      baseToken: 'USDC',
      quoteToken: 'USDC',
      baseTokenAddress: '',
      quoteTokenAddress: '',
      baseTokenList: tokenList,
      quoteTokenList: tokenList,
      startH: 0,
      startM: 0,
      startS: 0,
      durationH: 0,
      durationM: 0,
      durationS: 0,
    }
  },
  methods: {
    onChange(ev) {
      console.log(ev.target.value)
      if (ev.target.value < 0) {
        ev.target.value = 0
      }

      if (ev.target.id == 'startH') {
        this.startH = ev.target.value
      } else if (ev.target.id == 'startM') {
        this.startM = ev.target.value
      } else if (ev.target.id == 'startS') {
        this.startS = ev.target.value
      } else if (ev.target.id == 'durationH') {
        this.durationH = ev.target.value
      } else if (ev.target.id == 'durationM') {
        this.durationM = ev.target.value
      } else if (ev.target.id == 'durationS') {
        this.durationS = ev.target.value
      }
      console.log(this.startH, this.startM, this.startS)
      console.log(this.durationH, this.durationM, this.durationS)
    },
    onSelectBase(value) {
      this.baseToken = value
      let tokenMeta = getTokenMetaByName(value)
      console.log('onSelectBase', value, tokenMeta)
      this.baseTokenAddress = tokenMeta.contractAddress
    },
    onSelectQuote(value) {
      this.quoteToken = value
      let tokenMeta = getTokenMetaByName(value)
      console.log('onSelectQuote', value, tokenMeta)
      this.quoteTokenAddress = tokenMeta.contractAddress
    },
    async createAndApprove() {
      if (this.poolAddress == '') {
        console.log(this.$refs.raiseAmount.value, this.$refs.price.value)
        this.amount = this.$refs.raiseAmount.value
        this.price = this.$refs.price.value
        let now = Date.parse(new Date()) / 1000

        // pool time
        console.log(this.startH, this.startM, this.startS)
        console.log(this.durationH, this.durationM, this.durationS)
        let startTime = now + parseInt(this.startH, 10) * 3600 + parseInt(this.startM, 10) * 60 + parseInt(this.startS)
        let endTime = startTime + parseInt(this.durationH, 10) * 3600 + parseInt(this.durationM, 10) * 60 + parseInt(this.durationS)
        console.log('startTime', startTime, 'endTime', endTime)
        // raise base token
        let tx = await factory.methods.createPool(this.baseTokenAddress, this.quoteTokenAddress, BigInt(this.amount * 1e18), this.price * 10000, startTime, endTime).send({
          from: walletGlobal.account,
          // value: web3.utils.toWei('10', 'ether'),
        })
        let contractAddress = tx.events.PoolCreated.returnValues.contractAddress
        console.log('contractAddress', contractAddress)
        this.poolAddress = contractAddress
        this.btnTxt = `Approve`
      } else {
        console.log('approve pool', this.poolAddress)
        // sell quote token
        let token = new web3.eth.Contract(ERC20.abi, this.quoteTokenAddress)
        await token.methods.approve(this.poolAddress, BigInt(1e18 * this.amount * this.price * 10000)).send({
          from: walletGlobal.account,
          // value: web3.utils.toWei('10', 'ether'),
        })

        this.$toast.show(`Pool enabled`, {
          position: 'top',
          duration: 2000,
        })
      }
    },
  },
}
</script>

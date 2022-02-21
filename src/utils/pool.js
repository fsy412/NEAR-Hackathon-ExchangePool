import web3 from "./web3"
import ExchangePool from "../assets/ExchangePool.json"

async function getSwapInfos(address) {
    let poolContract = new web3.eth.Contract(ExchangePool.abi, address)
    let res = await poolContract.methods.getSwapInfo().call()
    console.log('getSwapInfos', res)
    return res
}

export {
    getSwapInfos
}
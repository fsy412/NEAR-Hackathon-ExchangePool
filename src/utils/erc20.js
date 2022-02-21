
import web3 from "./web3"
import ERC20 from '../assets/Token.json'

async function getBalance(contractAddress, account) {
    let token = new web3.eth.Contract(ERC20.abi, contractAddress)
    let res = await token.methods.balanceOf(account).call({
    })
    return web3.utils.fromWei(res, 'ether');
}

export {
    getBalance
}
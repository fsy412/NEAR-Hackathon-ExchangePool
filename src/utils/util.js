import { CONFIG } from '../config'

let tokenList = [
    { token: 'USDC', img: 'https://raw.githubusercontent.com/solana-labs/token-list/main/assets/mainnet/EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v/logo.png', contractAddress: CONFIG.USDC },
    { token: 'NEAR', img: 'https://near-drpc.blockpi.io/img/coin-logo.svg', contractAddress: CONFIG.NEAR },
    { token: 'FCON', img: 'https://raw.githubusercontent.com/spacefalcon-io/crypto/main/logo.svg', contractAddress: CONFIG.FCON },
]

function getTokenMeta(address) {
    let meta
    tokenList.map((v) => {
        if (v.contractAddress == address) {
            meta = v
        }
    })
    return meta
}

function getTokenMetaByName(name) {
    let meta
    tokenList.map((v) => {
        if (v.token == name) {
            meta = v
        }
    })
    return meta
}

export {
    tokenList,
    getTokenMeta,
    getTokenMetaByName
}
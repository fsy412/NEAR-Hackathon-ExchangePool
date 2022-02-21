import Web3 from 'web3';

const web3 = new Web3(window.web3.currentProvider);

var walletGlobal = {
    account: "",
}

async function connect() {
    // Modern dapp browsers...
    if (window.ethereum) {
        window.web3 = new Web3(window.ethereum);
        console.log("new web3")
        try {
            // Request account access if needed
            await window.ethereum.enable();
        } catch (error) {
            // User denied account access...
        }


    }
    // Legacy dapp browsers...
    else if (window.web3) {
        window.web3 = new Web3(web3.currentProvider);
    }
    // Non-dapp browsers...
    else {
        console.log("Non-Ethereum browser detected. You should consider trying MetaMask!");
    }

    const accounts = await web3.eth.getAccounts()
    walletGlobal.account = accounts[0]
    window.ethereum.on("accountsChanged", async ([selectedAccount]) => {
        const accounts = await web3.eth.getAccounts();
        console.log("accountsChanged", accounts)
    });
}

export default function UseWallet() {
    return {
        connect,
        web3,
        walletGlobal,
    }
}
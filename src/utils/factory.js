import web3 from "./web3"

import { CONFIG } from "../config"
import factory from "../assets/PoolFactory.json"

export default new web3.eth.Contract(factory.abi, CONFIG.PoolFactory)
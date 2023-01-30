import Web3 from "web3";
import Subscribe from "./subscribe.js";

const web3 = new Web3(new Web3.providers.WebsocketProvider("wss://goerli.infura.io/ws/v3/2fbe5e819f724568b78f8db99403672b"));

// https://etherscan.io/address/0x3b3ee1931dc30c1957379fac9aba94d1c48a5405
const foundation_token_address = "0x3B3ee1931Dc30C1957379FAc9aba94D1C48a5405";
// https://etherscan.io/address/0xcda72070e455bb31c7690a170224ce43623d0b6f
const foundation_market_address = "0xcda72070e455bb31c7690a170224ce43623d0b6f";

// 특정한 이벤트만 가져올 예정
const transfer_topic = "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef"
const market_list_topic = web3.utils.sha3("ReserveAuctionCreated (address, address, uint256, uint256, uint256, uint256, uint256)")
const market_sold_topic = web3.utils.sha3("ReserveAuctionFinalized (uint256, address, address, uint256, uint256, uint256)")

Subscribe(foundation_token_address, transfer_topic, "TRANSFER");
Subscribe(foundation_token_address, market_list_topic, "TRANSFER");
Subscribe(foundation_token_address, market_sold_topic, "TRANSFER");

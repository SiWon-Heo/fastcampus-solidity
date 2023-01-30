import Web3 from "web3";
import InsertToDB from "./dbutil.js";

const web3 = new Web3(new Web3.providers.WebsocketProvider("wss://goerli.infura.io/ws/v3/2fbe5e819f724568b78f8db99403672b"));

function Subscribe(contract_address, topic, type) {
  web3.eth.subscribe("logs", {
    topics: [topic]
  }, (err, result) => {
    if (err) {
      console.error(err);
    } else {
      console.log("##################################################");
      console.log("New Transaction Event");
      console.log(type);
      console.log("##################################################");
      getReceiptFindTransfer(result.transactionHash, type);
    }
  });
}

async function getReceiptFindTransfer(txid, type) {
  web3.eth.getTransactionReceipt(txid).then((result) => {
    var logs = result.logs;
    for (const log of logs) {
      var topic = log.topics;
      // https://etherscan.io/tx/0x9fd1962e5dd0f35d44d8c9312efe76f91adbfba3b5cf71d9b6cc892ae22e61e8#eventlog
      // transfer
      if (topic[0] == "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef") {
        console.log("####################################################");
        console.log("Find Transfer Log");
        console.log("####################################################");
        var token_id = topic[3];
        var before_owner = topic[1];
        var new_owner = topic[2];
        var contract_address = log.address;
        token_id = web3.utils.hexToNumberString(token_id);
        InsertToDB(contract_address, token_id, type, before_owner, new_owner);
      }
    }
  })
}

export default Subscribe;
# https://mainnet.infura.io/v3/2fbe5e819f724568b78f8db99403672b
from web3 import Web3
from web3.middleware import geth_poa_middleware
import json
from hexbytes import HexBytes


class HexJsonEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, HexBytes):
            return obj.hex()
        return super().default(obj)


w3 = Web3(Web3.HTTPProvider(
    'https://mainnet.infura.io/v3/2fbe5e819f724568b78f8db99403672b'))
w3.middleware_onion.inject(geth_poa_middleware, layer=0)

print(w3.isConnected())

print("Get Last Block")
latestBlock = w3.eth.get_block('latest')
print(json.dumps(dict(latestBlock), cls=HexJsonEncoder))


txList = latestBlock.transactions
print("Get Transaction Data")
for tx in txList:
    print("###########################################")
    print(Web3.toHex(tx))
    txDetail = w3.eth.getTransaction(Web3.toHex(tx))
    print(json.dumps(dict(txDetail), cls=HexJsonEncoder))
    print("###########################################")

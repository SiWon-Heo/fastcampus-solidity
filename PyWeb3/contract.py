# https://goerli.infura.io/v3/2fbe5e819f724568b78f8db99403672b
# 0x56e90cB358D586a0A2E8066B4CEEAE1575cfbD71
from web3 import Web3
from web3.middleware import geth_poa_middleware
import json
from eth_account import Account

w3 = Web3(Web3.HTTPProvider(
    'https://goerli.infura.io/v3/2fbe5e819f724568b78f8db99403672b'))
w3.middleware_onion.inject(geth_poa_middleware, layer=0)
private_key = "01f04c5482f62671b3c3103caeaa50b99dc842e846f0be6f8510e29999122e9a"
print("##################################################")
print("Private Key: ", private_key)
account = Account.from_key(private_key)
print("Account Address: ", account.address)
print("Account Balance: ", w3.eth.getBalance(account.address))
print("##################################################")

contractAddress = "0x56e90cB358D586a0A2E8066B4CEEAE1575cfbD71"
with open('./ERC20.json') as f:
    abi = json.load(f)

fctokenCa = w3.eth.contract(address=contractAddress, abi=abi)
print("##################################################")
print("Contract Address: ", contractAddress)
print("Symbol: ", fctokenCa.functions.symbol().call())
print("Owner Balance: ", fctokenCa.functions.balanceOf(account.address).call())

# Tx 보내기
# txid= fctokenCa.functions.transfer("0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266", 1000000).transact({"from": account.address})
# w3.eth.waitForTransactionReceipt(txid, 500)

k256 = sha3.keccak256()
k256.update('transfer(address, uint256)'.encode())
method_id = "0x" + k256.hexdigiest()
to_hex = "f39Fd6e51aad88F6F4ce6aB8827279cffFb92266".zfill(64)
# 00000...00f39Fd6e51aad88F6F4ce6aB8827279cffFb92266
value_hex = "{:064x}".format(10000000)
data = method_id[:10] + to_hex + value_hex

print("##################################################")
print("Input Data: ", data)
print("##################################################")

signedTransaction = w3.eth.account.sign_transaction(dict(
    nonce=w3.eth.getTransactionCount(account.address),
    gas=100000,
    maxFeePerGas=3000000000,
    maxPriorityFeePerGas=3000000000,
    # 보낼 곳 주소 -> 컨트랙트 주소.
    to=contractAddress,
    value=0,
    data=data,
    chainId=4,
    type=2
), private_key)

print("##################################################")
print(signedTransaction)
print("##################################################")

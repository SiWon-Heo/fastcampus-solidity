# https://goerli.infura.io/v3/2fbe5e819f724568b78f8db99403672b
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

signedTransaction = w3.eth.account.sign_transaction(dict(
    nonce=w3.eth.getTransactionCount(account.address),
    gas=100000,
    maxFeePerGas=3000000000,
    maxPriorityFeePerGas=3000000000,
    # 보낼 곳 주소 -> 현재 주소랑 다른 메타마스크 계정 생성 후 여기로 보내본다.
    to='0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266',
    value=w3.toWei(0.001, 'ether'),
    data=b'first Transaction From Web3Py',
    chainId=4,
    type=2
), private_key)

print("##################################################")
print(signedTransaction)
print("##################################################")

w3.eth.sendRawTransaction(signedTransaction.rawTransaction)
print(w3.eth.waitForTransactionReceipt(signedTransaction.hash, 500))

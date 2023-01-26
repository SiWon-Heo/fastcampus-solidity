//SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract Address {
    // checksum이 확인되지 않아 fail
    // address public failUser = 0xe0fe4d5a1437154cd0839886afc3945dffffc24f;
    address public user = 0xe0FE4D5a1437154cd0839886afc3945dfffFC24f;

    address payable public payable_user = payable(user);

    function sendEth() public payable {
        // address payable 타입이기 아니기 때문에 fail
        user.transfer(10000000000000000);
    }

    function getBalance() public view returns (unit) {
        // 대신 조회는 가능함
        return user.balance;
    }
}

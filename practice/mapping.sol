//SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract Mapping {
    //ERC20 잔액
    mapping(address => int) public balance;
    // key-value
    // no duplicated key

    balacne["0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"] = 100;
    uint public myBalance = balance["0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"];

    balance["0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92256"] = 50;
    // ...

    // ERC의 잔액은 CA에서 관리하기 때문에 이런 로직으로 관리된다고 생각하면 될듯.
}
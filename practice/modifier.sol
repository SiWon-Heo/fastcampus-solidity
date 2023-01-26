//SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract Modifier{
    uint public minPrice = 10000;
    
    mapping(address => uint) public orderList;
    function test1() public payable checkMinPrice{
        require(msg.value > minPrice);
        orderList[msg.sender] = msg.value
    }
    function test2() public payable checkMinPrice{
        require(msg.value > minPrice);
        orderList[msg.sender] = msg.value
    }
    
    // ...

    modifier checkMinPrice(){
        require(msg.value > minPrice);
        _;
    }
}
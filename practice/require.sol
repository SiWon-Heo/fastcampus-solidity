//SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract Require {
    function order() external payable {
        // 1. require
        require(msg.value != 0, "Msg.value should not be zero");

        // 2. if-else
        if (msg.value != 0) {
            orderList[msg.sender] = msg.value;
        } else {
            revert("Msg.value should not be zero");
        }
    }
}

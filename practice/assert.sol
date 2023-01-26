//SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract Assert {
    function order() external payable {
        // 1. assert
        assert(msg.value != 0); // 에러 발생시키고 롤백

        // 2. if-else
        if (msg.value != 0) {
            orderList[msg.sender] = msg.value;
        } else {
            revert();
        }
    }
}

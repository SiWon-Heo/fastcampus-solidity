//SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract Fallback {
    uint256 public data = 0;

    constructor() {
        data = 5;
    }

    function order() external payable {
        data = 9;
    }

    fallback() external payable {
        // 사용자가 존재하지 않는 함수를 호출하거나 msg.data가 비어있지 않은 경우 롤백
        revert();
    } // Proxy Contract

    receive() external payable {
        // 사용자가 ETH를 전송할 때, msg.data가 비어있지 않은 경우 롤백
        revert();
    }
}

//SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract transactionProperty2 {
    mapping(address => uint256) private orderList;

    function newOrderList() external payable {
        orderList[msg.sender] = msg.value;
    }

    bytes4 private checkFunction;

    function newcheckFunction(address sender, uint256 price)
        external
        returns (bool)
    {
        bytes selector = bytes4(keccak256("newOrderList()"));

        if (selector == msg.sig) {
            return true;
        }
    }
}

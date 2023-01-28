//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract ImpleV1 {
    address public implementation;
    uint256 public x;

    function inc() external {
        x += 1;
    }
}

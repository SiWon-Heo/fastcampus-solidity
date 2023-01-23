// SPDX-License-Identifier: MIT License
pragma solidity >=0.8.0 <0.9.0;

contract Solidity {
    // a -> Fun() -> b
    // 10 -> changeData() -> 15
    uint8 public a = 10;

    function changeData() public {
        a = 15;
    }
}

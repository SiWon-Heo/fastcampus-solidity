//SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract BlockProperty {
    // uint public block1 = block.basefee;
    uint256 public block2 = block.chainid;
    address payable public block3 = block.coinbase;
    uint256 public block4 = block.difficulty;
    uint256 public block5 = block.gaslimit;
    uint256 public block6 = block.number;
    uint256 public block7 = block.timestamp;
}

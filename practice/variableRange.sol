//SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract VariableRange {
    uint256 private data = 10;

    function getData() public view returns (uint256) {
        return data;
    }

    function getData2() public view returns (uint256) {
        uint256 data = 5;
        return data;
    }
}

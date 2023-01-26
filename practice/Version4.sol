// SPDX-License-Identifier: MIT License
pragma solidity >=0.4.0 <0.5.0;

contract FunctionV4 {
    uint8 private data = 255;

    function setData() public {
        data += 1;
    }

    function getData() public view returns (uint8) {
        return data;
    }
}

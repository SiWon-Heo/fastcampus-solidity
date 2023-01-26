// SPDX-License-Identifier: MIT License
pragma solidity >=0.8.0 <0.9.0;

contract DataType {
    bool public data1 = true; // false, no True, no 1

    int256 public data2 = 0;
    uint256 public data3 = 10; // only positive

    uint256 public data4 = 1000000000000000; // massive positive no, ~2^256-1
    int256 public data5 = 1000000000000000; // massive no.

    uint8 public data6 = 100; // small no. 0 ~ 2^8-1
    int8 public data7 = -100; // small no. -2^7 ~ 2^7-1

    string public data8 = "fastcampus";
    bytes public datat9 = "fastcampus";
    bytes20 public datat10 = hex"f39fd6e51aad88f6f4ce6ab8827279cfffb92266"; // address
    bytes32 public data11 =
        hex"462ce163a96ee19387c3834a0c4d829d4a8fa7535c6dc116ffd4e664d26024ca"; // transaction hash

    // *** float 없음 ***

    address public data12 = 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266;
}

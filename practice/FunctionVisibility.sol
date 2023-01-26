// SPDX-License-Identifier: MIT License
pragma solidity >=0.8.0 <0.9.0;

contract FunctionVisibility {
    uint8 private data = 255;
    uint8 public data = 255;

    // 외부공개 X, 상속된 ca X, 내부에서 O
    function setData(uint8 _data) private {
        data = _data;
    }

    // 외부공개 X, 상속된 ca O, 내부에서 O
    function setData(uint8 _data) internal {
        data = _data;
    }

    // 외부공개 O, 상속된 ca O, 내부에서 O
    function setData(uint8 _data) public {
        data = _data;
    }

    // 외부공개 O, 상속된 ca X, 내부에서 X
    function setData(uint8 _data) external {
        data = _data;
    }
}

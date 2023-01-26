// SPDX-License-Identifier: MIT License
pragma solidity >=0.8.0 <0.9.0;

contract PureView {
    // 영구적으로 저장되는 값: storage, 잠깐 생겼다가 증발해버리는 값: memory
    // 전역변수는 storage, 모든 노드가 저장
    uint8 storage private data = 255;

    // state값을 조회한 경우
    function getData() public view returns (uint8) {
        return data;
    }

    // state값을 조회하지 않은 경우
    function getPureData(string memory _data;) public pure returns (uint8) {
        uint8 memory temp_data = 9;
        return temp_data;
    }
}

// SPDX-License-Identifier: MIT License
pragma solidity >=0.8.0 <0.9.0;

contract Operation {
    uint256 public intData;
    string public stringData;

    function math() public {
        intData += 1;
        intData++;
        // 사칙연산 전부 지원
    }

    function weiToEth() public {
        uint256 wei_data = 1 wei;
        uint256 eth_data = wei_data * (10**18);
        // 1ETH = 10^18wei
        uint256 gwei_data = wei_data * (10**9);
    }

    function logical() public {
        // 논리연산 / 대소비교연산 가능. 생략
    }
}

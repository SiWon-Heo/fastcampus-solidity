//SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract This {
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function externalFunc() external {
        data = 15;
    }

    function internalFunc() internal {
        // external 타입이라 에러 발생
        externalFunc();

        // this를 사용하면 로직 생성 가능
        this.externalFunc();
    }
}

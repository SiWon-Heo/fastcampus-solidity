//SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract Calculation {
    event Transfer();

    function plusData(uint256 a, uint256 b) external returns (uint256) {
        return a + b;
    }

    fallback() external payable {
        emit Transfer();
    }
}

contract Caller {
    function isContract(address _addr) private returns (bool isContract) {
        uint32 size;
        assembly {
            size := extcodesize(_addr)
        }
        return (size > 0); // CA or EOA
    }

    function callFunc(
        address payable _address,
        uint256 _a,
        uint256 _b
    ) public returns (bytes memory) {
        bytes memory callFuncBytes = abi.encodeWithSignature(
            "plusData(uint256,uint256)",
            _a,
            _b
        );
        if (isContract(_address)) {
            (bool result, bytes memory sum) = _address.call(callFuncBytes);
            return sum;
        } else {
            revert();
        }
    }

    function callNotExistFunc(
        address payable _address,
        uint256 _a,
        uint256 _b
    ) public returns (bytes memory) {
        bytes memory callFuncBytes = abi.encodeWithSignature(
            "NotExistFunc(uint256,uint256)",
            _a,
            _b
        );
        if (isContract(_address)) {
            (bool result, bytes memory sum) = _address.call(callFuncBytes);
            return sum;
        } else {
            revert();
        }
    }
}

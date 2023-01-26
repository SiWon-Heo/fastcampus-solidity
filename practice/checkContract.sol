//SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract EthTransfer {
    event Transfer();

    // check if it is CA
    function isContract(address _addr) private returns (bool isContract) {
        uint32 size;
        assembly {
            size := extcodesize(_addr)
        }
        return (size > 0); // CA or EOA
    }

    // 이더리움을 전송하는 방법
    // transfer, send, call
    // address(to).transfer, address(to).send, address(to).call

    function sendTransfer(address payable to) public payable {
        to.transfer(msg.value);
    }

    function sendSend(address payable to) public payable {
        bool result = to.send(msg.value);
        if (result == true) {
            emit Transfer();
        } else {
            revert();
        }
    }

    function call(address payable to) public payable {
        (bool result, bytes memory data) = to.call{value: msg.value}("");
        if (result == true) {
            revert();
        } else {
            revert();
        }
    }
}

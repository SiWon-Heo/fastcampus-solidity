//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";

contract Dice is VRFConsumerBaseV2 {
    VRFCoordinatorV2Interface COORDINATOR;
    address private winner;

    uint64 s_subscriptionId = 9204;
    // https://docs.chain.link/docs/vrf/v2/subscription/examples/get-a-random-number/
    address vrfCoordinator = 0x2Ca8E0C643bDe4C2E08ab1fA0da3401AdAD7734D;
    // https://docs.chain.link/docs/vrf/v2/subscription/supported-networks/#configurations
    bytes32 keyHash =
        0x79d3d8832d904592c0bf9818b621522c988bb8b0c05cdc3b15aea1b6e8db0c15;
    // https://vrf.chain.link/goerli/new
    uint32 callbackGasLimit = 100000;
    uint16 requestConfirmations = 3;

    uint32 numWords = 1;

    uint256[] internal s_randomWords;
    uint256 public s_requestId;
    address s_owner;
    uint8 public answer;

    constructor(uint64 subscriptionId) VRFConsumerBaseV2(vrfCoordinator) {
        COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
        s_owner = msg.sender;
        s_subscriptionId = subscriptionId;
    }

    //   랜덤값을 요청하는 함수
    function requestRandomWords() internal returns (uint256) {
        //   COORDINATOR.requestRandomWords함수를 호출 시 request ID 값을 얻게된다.
        s_requestId = COORDINATOR.requestRandomWords(
            keyHash,
            s_subscriptionId,
            requestConfirmations,
            callbackGasLimit,
            numWords
        );
    }

    //    COORDINATOR가 fulfillRandomWords함수를 호출하며 생성된 랜덤값들을 사용자에게 보내준다. -> 외부에 믿을 수 있는 랜덤함수를 통해서 랜덤값을 생성해서 스마트컨트랙트에 입력해주는 방식
    function fulfillRandomWords(uint256, uint256[] memory randomWords)
        internal
        override
    {
        // 사용자는 randomWords 값을 가지고 이용한다.
        s_randomWords = randomWords;
        answer = uint8(s_randomWords[0] % 10);
    }

    function makeAnswer() public onlyOwner returns (uint256) {
        requestRandomWords();
    }

    function roll(uint256 dice_number) public payable {
        if (dice_number == answer) {
            winner = msg.sender;
        }
    }

    function getWinner() public view returns (address) {
        return winner;
    }

    modifier onlyOwner() {
        require(msg.sender == s_owner);
        _;
    }
}

// contract DiceAttack {
//   function attack(address _address) public payable {
//     // 이곳에서는 answer값을 구할 방법이 없다.
//     // EOA가 아닌 컨트랙트로 호출
//     IDice(_address).roll(answer);
//   }

//   // 위너가 되었을 때 출금하기 위함
//   function withdraw(address payable _to) public {
//     _to.transfer(address(this).balance);
//   }
// }

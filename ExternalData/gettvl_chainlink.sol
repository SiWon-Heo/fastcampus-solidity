// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract TvlCalculator {
    AggregatorV3Interface internal priceFeed;
    event Receive(address sender, uint256 value);

    // https://docs.chain.link/docs/ethereum-addresses
    constructor() {
        priceFeed = AggregatorV3Interface(
            0xA39434A63A52E749F02807ae27335515BA4b07F7
        );
    }

    function getDecimals() external view returns (uint8) {
        uint8 dec = priceFeed.decimals();
        return dec;
    }

    function getDescription() external view returns (string memory) {
        string memory des = priceFeed.description();
        return des;
    }

    function getLatestPrice() public view returns (int256) {
        (
            ,
            /* uint80 roundID */
            int256 price,
            ,
            ,

        ) = /* uint startedAt */
            /* uint timeStamp */
            /* uint80 answeredInRound */
            priceFeed.latestRoundData();
        return price;
    }

    function getTvlOnContract() public view returns (uint256) {
        int256 currentPrice = getLatestPrice();
        uint256 tvl = address(this).balance *
            (uint256(currentPrice) / (10**priceFeed.decimals())); // ETH price
        // uint tvl = IERC20(_address).balanceOf("msg.sender") * (uint(currentPrice) / (10**priceFeed.decimals())); // ERC20 price
        return tvl;
    }

    fallback() external payable {
        emit Receive(msg.sender, msg.value);
    }

    receive() external payable {
        emit Receive(msg.sender, msg.value);
    }
}

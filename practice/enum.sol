//SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract Enum {
    enum Status{
        Not Sale,
        Auction,
        Sales,
        Bid,
        Sold
    }

    Status public auctionStatus;

    function auctionStart() public {
        auctionStatus = Status.Auction
    }
    function bid() public {
        auctionStatus = Status.Bid;
    }
    function sold() public {
        auctionStatus = Status.Sold;
    }
}
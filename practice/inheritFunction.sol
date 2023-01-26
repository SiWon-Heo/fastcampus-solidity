//SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract Seller {
    address private seller;
    string private location;

    constructor(address _seller) {
        seller = _seller;
    }

    function getSeller() public view returns (address) {
        return seller;
    }
}

contract Car {
    string private types;
    uint8 private door;
    uint256 private price;

    constructor(
        string memory _types,
        uint8 _door,
        uint256 _price
    ) {
        types = _types;
        door = _door;
        price = _price;
    }

    function getDoor() public view returns (uint8) {
        return door;
    }

    function getPrice() public view virtual returns (uint256) {
        return price;
    }
}

contract Benz is
    Car("suv", 4, 10000),
    Seller(0xe0FE4D5a1437154cd0839886afc3945dfffFC24f)
{
    string private model;
    address private owner;
    uint256 private premium;

    constructor(string memory _model, uint256 _premium) {
        model = _model;
        owner = msg.sender;
        premium = _premium;
    }

    function getModel() public view returns (string memory) {
        return model;
    }

    function getPrice() public view override returns (uint256) {
        return premium;
    }

    function getCarPrice() public view returns (uint256) {
        return super.getPrice();
    }
}

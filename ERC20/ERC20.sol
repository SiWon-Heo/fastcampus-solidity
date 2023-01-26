// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ERC20 {
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowance;
    uint256 private _totalSupply;
    string private _name; // ETHEREUM
    string private _symbol; // ETH
    uint8 private _decimals; // 18 // tether: 6 -> 1000000 = 1 tether

    address public owner;
    mapping(address => bool) private _blackList;

    modifier checkBlackList() {
        require(!_blackList[msg.sender], "Banned User");
        _;
    }
    // transfer, approve 함수에서 중복 사용
    modifier checkBalance(uint256 amount) {
        require(_balances[msg.sender] > amount, "NOT Sufficient Balance");
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Owner");
        _;
    }

    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Approval(address indexed from, address indexed to, uint256 amount);

    constructor(
        string memory _name_,
        string memory _symbol_,
        uint8 _decimals_
    ) {
        _name = _name_;
        _symbol = _symbol_;
        _decimals = _decimals_;
        _totalSupply = 10000000 * (10**18);
        owner = msg.sender;
    }

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    function transfer(address to, uint256 amount)
        public
        checkBalance(amount)
        checkBlackList
        returns (bool)
    {
        // require(_balances[from] > amount, "NOT sufficient Balance"); // 누구든 호출할 수 있는 함수가 되어서 취약점이 발생함. from은 쓰지 않는게 좋다.
        _balances[msg.sender] -= amount;
        _balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }

    function allowance(address owner, address spender)
        public
        view
        returns (uint256)
    {
        return _allowance[owner][spender];
    }

    function approve(address spender, uint256 amount)
        public
        checkBalance(amount)
        checkBlackList
        returns (bool)
    {
        _allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _balances[to] += amount;
        _totalSupply += amount;
    }

    function burn(address to, uint256 amount) public onlyOwner {
        _balances[to] -= amount;
        _totalSupply -= amount;
    }

    function burnByUser(uint256 amount) public {
        transfer(address(0), amount);
        _totalSupply -= amount;
    }

    function setBlackList(address to) public onlyOwner {
        _blackList[to] = true;
    }

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public checkBlackList returns (bool) {
        require(_balances[from] > amount, "NOT sufficient Balance");
        require(_allowance[from][to] > amount, "NOT sufficient Balance");
        require(to == msg.sender, "Not Allowed");
        _balances[from] -= amount;
        _balances[to] += amount;
        emit Transfer(from, to, amount);
        return true;
    }
}

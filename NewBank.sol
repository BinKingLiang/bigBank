// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import "IBank.sol";
contract NewBank is IBank{
    address public owner;
    mapping(address => uint256) private _balances;

    modifier onlyOwner() {
        require(msg.sender == owner, "Unauthorized access");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // 存款函数（支持重写）
    function deposit() public payable virtual override {
        _balances[msg.sender] += msg.value;
    }

    // 提款函数（需指定金额）
    function withdraw(uint256 amount) public override onlyOwner {
        require(amount <= address(this).balance, "Insufficient contract balance");
        payable(owner).transfer(amount);
    }

    // 查询调用者余额
    function getBalance() public view override returns (uint256) {
        return _balances[msg.sender];
    }

    // 管理员转移函数
    function transferOwnership(address newOwner) public virtual onlyOwner {
        owner = newOwner;
    }
}
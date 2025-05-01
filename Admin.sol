// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import "IBank.sol";
contract Admin{
        address public owner;
    
    // 权限修饰器
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // 接收ETH的回退函数（必要）
    receive() external payable {}

    // 资金提取方法（核心逻辑）
    function adminWithdraw(IBank bank) external onlyOwner {
        // 获取目标合约全部余额
        uint256 balance = address(bank).balance;
        // 调用银行合约的提款方法
        bank.withdraw(balance); // 转账到当前合约地址
    }

}
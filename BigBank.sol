// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import "NewBank.sol";
contract BigBank is NewBank{
        // 存款金额限制修饰器
    modifier minDeposit() {
        require(msg.value > 0.001 ether, "Minimum deposit 0.001 ETH required");
        _;
    }

    // 带金额限制的存款函数
    function deposit() public payable override minDeposit {
        super.deposit(); // 调用父合约存款逻辑
    }

    // 管理员转移（继承父合约功能）
    function transferOwnership(address newOwner) public override onlyOwner {
        super.transferOwnership(newOwner);
    }

}
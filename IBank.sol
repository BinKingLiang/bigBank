// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

interface IBank {
    function deposit() external payable;
    function withdraw(uint256 amount) external;
    function getBalance() external view returns (uint256);

}
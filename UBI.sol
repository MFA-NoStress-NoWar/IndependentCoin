
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UBI {
    mapping(address => uint256) public lastClaimed;
    uint256 public weeklyAmount = 10 * 1e18;

    function claim() external {
        require(block.timestamp - lastClaimed[msg.sender] >= 7 days, "Already claimed this week.");
        lastClaimed[msg.sender] = block.timestamp;
        payable(msg.sender).transfer(weeklyAmount);
    }

    receive() external payable {}
}

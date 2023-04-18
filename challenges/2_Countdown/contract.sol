// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    uint public tickCount;

    function tick() external {
        tickCount++;
        if (tickCount >= 10) {
            selfdestruct(payable((msg.sender)));
        }
    }
}
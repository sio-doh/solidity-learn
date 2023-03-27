// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    address payable public owner;
    constructor() {
        owner = payable(msg.sender);
    } 
    event Received(address sender, uint amount);
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }
    function tip() public payable {
        require(msg.value > 0, "Tip should be greater than 0"); 
        owner.transfer(msg.value);
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    address payable public owner;
    address payable public charity;

    constructor(address payable _charity) {
        require(_charity != address(0), "Charity address must not be zero");
        owner = payable(msg.sender);
        charity = _charity;
    }
    receive() external payable {}
    function tip() public payable { 
        owner.transfer(msg.value);
    }

    function donate() public {
        charity.transfer(address(this).balance);
    } 
}
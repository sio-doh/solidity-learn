// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible { 
    address public owner;
    event Deployed(address indexed owner); 
    event Transfer(address indexed owner, address newOwner); 
    event ForSale(uint price, uint timestamp);

    constructor() {
        owner = msg.sender;
        emit Deployed(owner);
    }

    function transfer(address newOwner) public {
        require(msg.sender == owner, "Ownership can only be transferred by the owner.");
        owner = newOwner;
        emit Transfer(msg.sender, newOwner);
    }
    
    function markPrice(uint askingPrice) public {
        require(msg.sender == owner, "Ownership can only be transferred by the owner.");
        emit ForSale(askingPrice, block.timestamp);
    }
}
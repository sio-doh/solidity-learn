// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible { 
    uint public amount;
    address public owner;
    uint public askingPrice; 
    bool public forSale;
    event Deployed(address indexed owner); 
    event Transfer(address indexed owner, address indexed newOwner); 
    event ForSale(uint price, uint timestamp);
    event Purchase(uint indexed amount, address indexed buyer);

    constructor() {
        owner = msg.sender;
        emit Deployed(owner);
    }

    function transfer(address newOwner) public {
        require(msg.sender == owner, "Ownership can only be transferred by the owner.");
        owner = newOwner;
        emit Transfer(msg.sender, newOwner);
    }
    
    function markPrice(uint _askingPrice) public {
        require(msg.sender == owner, "Ownership can only be transferred by the owner."); 
        askingPrice = _askingPrice;
        forSale = true;
        emit ForSale(askingPrice, block.timestamp);
    } 

    function purchase() external payable {
        require(forSale, "Collectible is not for sale.");
        require(msg.value >= askingPrice, "Insufficient funds available to buy collectible."); 
        address payable seller = payable(owner);
        owner = msg.sender;
        forSale = false; 
        seller.transfer(msg.value);
        emit Purchase(msg.value, msg.sender);
    }
}
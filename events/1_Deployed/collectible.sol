// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {
    event Deployed(address indexed owner); 
    constructor() {
        address owner = msg.sender;
        emit Deployed(owner);
    }
}
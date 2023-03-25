// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    address payable public owner;
    constructor() {
        owner = payable(msg.sender);
    }
}
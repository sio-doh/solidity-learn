// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    function double(uint i) external pure returns(uint) {
        return i * 2;
    }
}
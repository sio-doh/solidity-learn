// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library UIntFunctions {
    function isEven(uint num) public view returns (bool) {
        return num % 2 == 0;
    }
}
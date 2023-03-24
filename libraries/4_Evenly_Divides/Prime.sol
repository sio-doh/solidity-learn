// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library Prime {
    function dividesEvenly(uint x, uint y) public pure returns (bool) {
        return (x % y == 0) ? true : false;
    }
}
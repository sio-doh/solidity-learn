// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


library Prime {
    function dividesEvenly(uint x, uint y) public pure returns (bool) {
        return (x % y == 0) ? true : false;
    } 
    function isPrime(uint z) public pure returns (bool) {
        if (z <= 1) {
            return false;
        } 
        for (uint i = 2; i <= z / 2; i++) {
            if (dividesEvenly(z, i)) {
                return false;
            }
        }
        return true;
    }
}
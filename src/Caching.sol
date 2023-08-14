// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract CachingBad {
    uint256 public a = 10;

    function interact(uint256 input) external returns (uint256) {
        uint256 i = 0;
        uint256 result = 0;

        for(i; i < a; i++) {
            result += input;
        }

        return result;
    }
}

contract CachingGood {
    uint256 public a = 10;

    function interact(uint256 input) external returns (uint256) {
        uint256 i = 0;
        uint256 result = 0;
        uint256 aCached = a;

        for(i; i < aCached; i++) {
            result += input;
        }

        return result;
    }
}

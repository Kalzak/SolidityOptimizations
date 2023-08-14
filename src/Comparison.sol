// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract ComparisonBad {
    function interact(uint256 input) external returns (uint256) {
        uint256 a = 0;
        uint256 i = 0;
        for(i; i < input; i++) {
            a += input;
        }
        return a;
    }
}

contract ComparisonGood {
    function interact(uint256 input) external returns (uint256) {
        uint256 a = 0;
        uint256 i = 0;
        for(i; i != input; i++) {
            a += input;
        }
        return a;
    }
}

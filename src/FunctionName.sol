// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract FunctionNameBad {
    function interact(uint256 a, uint256 b) public returns (uint256) {
        return a + b;
    }
}

contract FunctionNameGood {
    function interact_102C469(uint256 a, uint256 b) public returns (uint256) {
        return a + b;
    }
}

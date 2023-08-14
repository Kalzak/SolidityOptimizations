// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract VisibilityBad {
    function interact(uint256 input) public returns (uint256) {
        uint256 a = 12;
        uint256 b = calculate(input);
        return a + b;
    }   

    function calculate(uint256 a) public returns (uint256) {
        return a * 12;
    }
}

contract VisibilityGood {
    function interact(uint256 input) external returns (uint256) {
        uint256 a = 12;
        uint256 b = calculate(input);
        return a + b;
    }   

    function calculate(uint256 a) internal returns (uint256) {
        return a * 12;
    }
}

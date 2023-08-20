// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract SwapBad {
    function interact() public returns (uint256, uint256) {
        uint256 a = 12;
        uint256 b = 24;

        uint256 temp = a;
        a = b;
        b = temp;
        
        return (a, b);
    }   
}

contract SwapGood {
    function interact() public returns (uint256, uint256) {
        uint256 a = 12;
        uint256 b = 24;

        (a, b) = (b, a);

        return (a, b);
    }   
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract RequireBad {
    function interact(uint256 value) public {
        require(value != 2 && value != 4 && value != 6, "invalid value");
    }   
}

contract RequireGood {
    function interact(uint256 value) public {
        require(value != 2, "invalid value");
        require(value != 4, "invalid value");
        require(value != 6, "invalid value");
    }   
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract BatchBad {
    uint256 a = 99;

    function interact(uint256 input) external {

        a = (input * 15) / 5 + 2;
    }
}

contract BatchGood {
    uint256 a = 99;

    function interact(uint256 input) public {
        a = (input * 15) / 5 + 2;
    }

    function interactBatch(uint256[] memory input) external {
        uint256 i = 0;
        for(i; i < input.length; i++) {
            interact(input[i]);
        }
    }
}

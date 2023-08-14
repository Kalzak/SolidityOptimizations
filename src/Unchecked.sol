// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract UncheckedBad {
    function interact(uint256 input) external returns (uint256) {
        uint256 i = 0;
        uint256 result = 0;

        for(i; i < 10; i++) {
            result += input;
        }

        return result;
    }
}

contract UncheckedGood {
    function interact(uint256 input) external returns (uint256) {
        uint256 i = 0;
        uint256 result = 0;

        for(i; i < 10; ) {
            result += input;

            unchecked {
                i++;
            }
        }

        return result;
    }
}

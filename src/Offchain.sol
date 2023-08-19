// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract OffchainBad {
    function interact(uint256[] memory input) public returns (uint256) {
        // Sort
        for (uint256 i = 0; i < input.length - 1; i++) {
            for (uint256 j = i + 1; j < input.length; j++) {
                if (input[i] > input[j]) {
                    uint256 temp = input[i];
                    input[i] = input[j];
                    input[j] = temp;
                }
            }
        }
        
        // Sum
        uint256 sum = 0;
        for (uint256 i = 0; i < input.length; i++) {
            sum += input[i];
        }
        return sum;
    }   
}

contract OffchainGood {
    function interact(uint256[] memory input) public returns (uint256) {
        uint256 sum = input[0];

        uint256 i = 1;

        for(i; i < input.length; i++) {
            require(input[i] > input[i-1]);
            sum += input[i];
        }

        return sum;
    }   
}

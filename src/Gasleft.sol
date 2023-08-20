// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract GasleftBad {
    function interact(uint256 value, uint256 loops) public returns (uint256) {
        uint256 total = 0;
        
        uint256 i = 0;
        for(i; i < loops; i++) {
            total += value;
        }

        return total;
    }
}

contract GasleftGood {
    function interact(uint256 value, uint256 loops) public returns (uint256) {
        uint256 total = 0;

        uint256 end = gasleft() - (loops * 116);
        
        while(gasleft() > end) {
            total += value;
        }

        return total;
    }
}

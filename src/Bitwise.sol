// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract BitwiseSoloBad {
    function interact(uint256 input) public returns (uint256) {
        unchecked {
            uint256 times32 = input * 32;
            
            return times32;
        }
    }   
}

contract BitwiseSoloGood {
    function interact(uint256 input) external returns (uint256) {
        unchecked {
            uint256 times32 = input << 5;
            
            return times32;
        }
    }   
}

contract BitwiseMultiBad {
    function interact(uint256 input) public returns (uint256) {
        unchecked {
            uint256 times32 = input * 32;
            uint256 div32 = input / 32;
            
            return times32 + div32;
        }
    }   
}

contract BitwiseMultiGood {
    function interact(uint256 input) external returns (uint256) {
        unchecked {
            uint256 times32 = input << 5;
            uint256 div32 = input >> 5;
            
            return times32 + div32;
        }
    }   
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract CalldataBad {
    string public word;
    
    function interact(string memory input) external {
        word = input;
    }
}

contract CalldataGood {
    string public word;
    
    function interact(string calldata input) external {
        word = input;
    }
}

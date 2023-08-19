// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract EventsBad {
    event EmitValue(uint256 indexed value);
    event EmitWord(string word);

    function interactWord(string memory word) public {
        emit EmitWord(word);
    }   

    function interactValue(uint256 value) public {
        emit EmitValue(value);
    }   
}

contract EventsGood {
    event EmitValue(uint256 value);
    event EmitWord(string indexed word);

    function interactWord(string memory word) public {
        emit EmitWord(word);
    }   

    function interactValue(uint256 value) public {
        emit EmitValue(value);
    }   
}

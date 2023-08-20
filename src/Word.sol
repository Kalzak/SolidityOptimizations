// SPDX-License-Identifier: UNLICENSED    
pragma solidity ^0.8.13;    
    
contract WordPlusPlusBad {    
    function interact() public returns (uint256) {                      
        uint8 a = 10;
        a ++;
        return a;
    }    
}    

contract WordPlusEqualsBad {    
    function interact() public returns (uint256) {                      
        uint8 a = 10;
        a += 1;
        return a;
    }    
}    
    
contract WordPlusPlusGood {    
    function interact() public returns (uint256) {                      
        uint256 a = 10;
        a ++;
        return a;
    }    
}    

contract WordPlusEqualsGood {    
    function interact() public returns (uint256) {                      
        uint256 a = 10;
        a += 1;
        return a;
    }    
}    

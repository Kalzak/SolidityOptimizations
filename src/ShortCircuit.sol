// SPDX-License-Identifier: UNLICENSED    
pragma solidity ^0.8.13;    
    
contract ShortCircuitBad {    

    /// @param high has a high probability of being true
    /// @param low has a low probability of being true
    function interact(bool high, bool low) public {                      
        low || high;

        high && low;
    }    
}    

contract ShortCircuitGood {    

    /// @param high has a high probability of being true
    /// @param low has a low probability of being true
    function interact(bool high, bool low) public {                      
        high || low;

        low && high;
    }    
}    

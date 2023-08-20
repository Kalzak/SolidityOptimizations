// SPDX-License-Identifier: UNLICENSED    
pragma solidity ^0.8.13;    
    
contract DontCacheBad {    

    function interact() public {                      
        uint256[] memory times = new uint256[](5);
        times[0] = 1673848200;
        times[1] = 1681272900;
        times[2] = 1684725900;
        times[3] = 1699609600;
        times[4] = 1708867200;

        uint256 timestamp = block.timestamp;
        uint256 numFutureTimes = 0;

        for(uint256 i = 0; i < times.length; i++) {
            if (times[i] > timestamp) {
                numFutureTimes++;
            }
        }
    }    
}    

contract DontCacheGood {    

    function interact() public {                      
        uint256[] memory times = new uint256[](5);
        times[0] = 1673848200;
        times[1] = 1681272900;
        times[2] = 1684725900;
        times[3] = 1699609600;
        times[4] = 1708867200;

        uint256 numFutureTimes = 0;

        for(uint256 i = 0; i < times.length; i++) {
            if (times[i] > block.timestamp) {
                numFutureTimes++;
            }
        }
    }    
}    


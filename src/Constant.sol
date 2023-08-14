// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract ConstantBad {
    // 0x49206e65766572206368616e6765 is "I never change"
    uint256 public neverChange = 0x49206e65766572206368616e6765; 

    function interact() public returns (uint256) {
        return neverChange;
    }
}

contract ConstantGood {
    // 0x49206e65766572206368616e6765 is "I never change"
    uint256 public constant neverChange = 0x49206e65766572206368616e6765; 

    function interact() public returns (uint256) {
        return neverChange;
    }
}

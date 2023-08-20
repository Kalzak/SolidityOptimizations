// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract ConstructorBad {
    uint256 value;

    constructor() {
        value = 12;
    }

    function interact() public {}
}

contract ConstructorGood {
    uint256 value;

    constructor() payable {
        value = 12;
    }

    function interact() public {}
}

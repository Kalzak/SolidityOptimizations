// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract PackingBad {
    uint8 public a;
    uint256 public b;
    uint32 public c;
    uint256 public d;
    address public e;

    function interact() public {
        a = 12;
        c = 34;
        e = address(0x1234);
    }
}

contract PackingGood {
    uint256 public b;
    uint256 public d;
    address public e;
    uint32 public c;
    uint8 public a;

    function interact() public {
        a = 12;
        c = 34;
        e = address(0x1234);
    }
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract InitializeBad {
    enum Status {
        Default,
        InProgress,
        Completed
    }

    Status public status;

    function interact() external returns (uint256) {
        return 12;
    }
}

contract InitializeGood {
    enum Status {
        Default,
        InProgress,
        Completed
    }

    Status public status;

    function interact() external returns (uint256) {
        status = Status.Default;
        return 12;
    }
}

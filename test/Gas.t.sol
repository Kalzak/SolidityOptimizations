// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";

// T1
import "../src/Packing.sol";
import "../src/Constant.sol";
import "../src/Visibility.sol";
import "../src/Calldata.sol";
import "../src/Caching.sol";

// T2
import "../src/Plusplus.sol";
import "../src/Unchecked.sol";
import "../src/Batch.sol";
import "../src/Initialize.sol";
import "../src/Comparison.sol";

contract GasTest is Test {

    //
    // TIER 1
    //

    /*
    // Saves
    function testPacking() public {
        PackingGood good = new PackingGood();
        good.interact();

        PackingBad bad = new PackingBad();
        bad.interact();
    }

    // Saves
    function testConstant() public {
        ConstantGood good = new ConstantGood();
        good.interact();

        ConstantBad bad = new ConstantBad();
        bad.interact();

    }

    // NotSaves
    function testVisibility() public {
        VisibilityGood good = new VisibilityGood();
        good.interact(12);

        VisibilityBad bad = new VisibilityBad();
        bad.interact(12);

    }

    // Saves
    function testCalldata() public {
        CalldataGood good = new CalldataGood();
        good.interact("Hello");

        CalldataBad bad = new CalldataBad();
        bad.interact("Hello");

    }

    // Saves
    function testCaching() public {
        CachingGood good = new CachingGood();
        good.interact(12);

        CachingBad bad = new CachingBad();
        bad.interact(12);
    }
    */

    //
    // TIER 2
    //

    // Saves
    function testPlusplus() public {
        PlusplusGood good = new PlusplusGood();
        good.interact(12);

        PlusplusBad bad = new PlusplusBad();
        bad.interact(12);
    }
    
    // Saves
    function testUnchecked() public {
        UncheckedGood good = new UncheckedGood();
        good.interact(12);

        UncheckedBad bad = new UncheckedBad();
        bad.interact(12);
    }

    // Saves (with note)
    // Only for EOA interactions because 21000 base call cost
    // For smart contracts they shouldn't use the batch function, easier to just call directly
    function testBatch() public {
        uint256[] memory inputs = new uint256[](10);
        inputs[0] = 1;
        inputs[1] = 2;
        inputs[2] = 3;
        inputs[3] = 4;
        inputs[4] = 5;
        inputs[5] = 6;
        inputs[6] = 7;
        inputs[7] = 8;
        inputs[8] = 9;
        inputs[9] = 10;
        BatchGood good = new BatchGood();
        good.interactBatch(inputs);

        
        BatchBad bad = new BatchBad();
        bad.interact(1);
        bad.interact(2);
        bad.interact(3);
        bad.interact(4);
        bad.interact(5);
        bad.interact(6);
        bad.interact(7);
        bad.interact(8);
        bad.interact(9);
        bad.interact(10);
    }

    // Saves
    function testInitialize() public {
        InitializeGood good = new InitializeGood();
        good.interact(12);

        InitializeBad bad = new InitializeBad();
        bad.interact(12);
    }

    // Saves
    // Because in loops the "terminate case" should be true
    // So looking for the opposite of our condition specified
    // When looking for GT or LT, it needs to opposite that with a NE afterwards (extra op)
    // But when doing != the opposite of that is == which is just EQ so one OP
    function testComparison() public {
        ComparisonGood good = new ComparisonGood();
        good.interact(12);

        ComparisonBad bad = new ComparisonBad();
        bad.interact(12);
    }

}

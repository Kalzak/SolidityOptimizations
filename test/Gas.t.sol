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
import "../src/MultipleData.sol";

// T3
import "../src/Offchain.sol";
import "../src/Events.sol";

contract GasTest is Test {

    /*

    //
    // TIER 1
    //

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

    function testMultipleData() public {
        address[] memory users = new address[](3);
        uint256[] memory favnums = new uint256[](3);
        uint256[] memory leastfavnums = new uint256[](3);
        users[0] = address(0x1234);
        users[1] = address(0x2345);
        users[2] = address(0x3456);
        favnums[0] = 1;
        favnums[1] = 2;
        favnums[2] = 3;
        leastfavnums[0] = 4;
        leastfavnums[1] = 5;
        leastfavnums[2] = 6;

        MultipleDataGood.MultipleDataInput[] memory data = new MultipleDataGood.MultipleDataInput[](3);
        data[0].user = address(0x1234);
        data[1].user = address(0x2345);
        data[2].user = address(0x3456);
        data[0].favnum = 1;
        data[1].favnum = 2;
        data[2].favnum = 3;
        data[0].leastfavnum = 4;
        data[1].leastfavnum = 5;
        data[2].leastfavnum = 6;

        MultipleDataGood good = new MultipleDataGood();
        good.interact(data);

        MultipleDataBad bad = new MultipleDataBad();
        bad.interact(users, favnums, leastfavnums);
    }

    */

    //
    // TIER 3
    //

    // Saves
    function testOffchain() public {
        uint256[] memory inputs = new uint256[](10);
        inputs[0] = 0;
        inputs[1] = 1;
        inputs[2] = 2;
        inputs[3] = 3;
        inputs[4] = 4;
        inputs[5] = 5;
        inputs[6] = 6;
        inputs[7] = 7;
        inputs[8] = 8;
        inputs[9] = 9;
        OffchainGood good = new OffchainGood();
        good.interact(inputs);

        inputs[0] = 10;
        inputs[1] = 9;
        inputs[2] = 8;
        inputs[3] = 7;
        inputs[4] = 6;
        inputs[5] = 5;
        inputs[6] = 4;
        inputs[7] = 3;
        inputs[8] = 2;
        inputs[9] = 1;
        OffchainBad bad = new OffchainBad();
        bad.interact(inputs);
    }

    function testEvents() public {
        uint256 value = 12;
        string memory word = "hello";

        EventsGood good = new EventsGood();
        good.interactWord(word);
        good.interactValue(value);

        EventsBad bad = new EventsBad();
        bad.interactWord(word);
        bad.interactValue(value);
    }
}

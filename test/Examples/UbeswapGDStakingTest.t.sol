// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { CustomReward } from "../../src_examples/UbeswapGDStaking/CustomReward.sol";
import { Test, console2 } from "lib/forge-std/src/Test.sol";
import { User } from "../structs/User.sol";

contract UbeswapTest is Test {
    uint256 DISTRIBUTION_PARAMETER = vm.envUint("DISTRIBUTION_PARAMETER");
    
    // this user has staked
    User user1 = User({
        userAddress: 0x6EDbfb0eA84d0eb820071932eAeBb19a8686E409,
        expectedEligible: true,
        expectedRewardAmount: DISTRIBUTION_PARAMETER}
    );
    // this user has not staked
    User user2 = User({
        userAddress: address(2),
        expectedEligible: false,
        expectedRewardAmount: DISTRIBUTION_PARAMETER
    });
    
    CustomReward customReward;

    function setUp() public {
        customReward = new CustomReward();
    }

    function testRewardAmountsAreAsExpected() public view {
        bool actualEligible1 = customReward.isEligible(user1.userAddress);
        bool actualEligible2 = customReward.isEligible(user2.userAddress);

        uint256 actualRewardAmount1 = customReward.rewardAmountForUser(user1.userAddress, DISTRIBUTION_PARAMETER);
        uint256 actualRewardAmount2 = customReward.rewardAmountForUser(user2.userAddress, DISTRIBUTION_PARAMETER);

        console2.log("actualEligible1:   ", actualEligible1);
        console2.log("expectedEligible1: ", user1.expectedEligible);
        console2.log("actualEligible2:   ", actualEligible2);
        console2.log("expectedEligible2: ", user2.expectedEligible);
        console2.log("actualRewardAmount1:   ", actualRewardAmount1);
        console2.log("expectedRewardAmount1: ", user1.expectedRewardAmount);
        console2.log("actualRewardAmount2:   ", actualRewardAmount2);
        console2.log("expectedRewardAmount2: ", user2.expectedRewardAmount);
        
        assert(actualEligible1 == user1.expectedEligible);
        assert(actualEligible2 == user2.expectedEligible);
        assert(actualRewardAmount1 == user1.expectedRewardAmount);
        assert(actualRewardAmount2 == user2.expectedRewardAmount);
    }
}
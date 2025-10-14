// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { CustomReward } from "../src/CustomReward.sol";
import { Test, console2 } from "lib/forge-std/src/Test.sol";

struct User {
    address userAddress;
    uint256 numberOfCorrectAnswers;
    uint256 expectedRewardAmount;
}

contract CustomRewardTest is Test {
    uint256 REWARD_AMOUNT_PER_PERSON = vm.envUint("REWARD_AMOUNT_PER_PERSON");
    uint256 REWARD_AMOUNT_PER_CORRECT_ANSWER = vm.envUint("REWARD_AMOUNT_PER_CORRECT_ANSWER");
    
    CustomReward customReward;
    User user1 = User({
        userAddress: address(1),
        numberOfCorrectAnswers: 5e18,
        expectedRewardAmount: 5 * REWARD_AMOUNT_PER_CORRECT_ANSWER}
    );
    User user2 = User({
        userAddress: address(2),
        numberOfCorrectAnswers: 6e18,
        expectedRewardAmount: 6 * REWARD_AMOUNT_PER_CORRECT_ANSWER
    });
    
    function setUp() public {
        customReward = new CustomReward();
    }

    function testRewardAmountsAreAsExpected() public view {
        uint256 actualRewardAmount1 = customReward.getCustomRewardAmountForUser(
            user1.userAddress,
            user1.numberOfCorrectAnswers,
            REWARD_AMOUNT_PER_PERSON,
            REWARD_AMOUNT_PER_CORRECT_ANSWER
        );

        uint256 actualRewardAmount2 = customReward.getCustomRewardAmountForUser(
            user2.userAddress,
            user2.numberOfCorrectAnswers,
            REWARD_AMOUNT_PER_PERSON,
            REWARD_AMOUNT_PER_CORRECT_ANSWER
        );

        console2.log("actualRewardAmount1:   ", actualRewardAmount1);
        console2.log("expectedRewardAmount1: ", user1.expectedRewardAmount);
        console2.log("actualRewardAmount2:   ", actualRewardAmount2);
        console2.log("expectedRewardAmount2: ", user2.expectedRewardAmount);
        
        assert(actualRewardAmount1 == user1.expectedRewardAmount);
        assert(actualRewardAmount2 == user2.expectedRewardAmount);
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { ICustomReward } from "../../interfaces/ICustomReward.sol";

interface IUBISchemeV2 {
    function totalClaimsPerUser(address user) external view returns (uint256 totalClaims);
}

/**
 * @title CustomReward for GoodDollar Academy exam
 * @notice Users that pass the exam are eligible for rewards and the amount they get
 * is: number of correct answers * number of times they have claimed
 */
contract CustomReward is ICustomReward {
    function name() external pure returns (string memory) {
        return "GoodDollar Claims";
    }

    function eligibilityDescription() external pure returns (string memory) {
        return "No extra eligibility criteria.";
    }

    function distributionDescription() external pure returns (string memory) {
        return "Each user receives a reward based on how many times they have claimed. The reward amount is calculated as: 1,000 + number of times they have claimed * 100. The maximum amount is 10,000 tokens.";
    }

    function isEligible(address /*  user */) external pure returns (bool) {
        return true;
    }

    function rewardAmountForUser(address user, uint256 /* distributionParameter */) external view returns (uint256) {
        // set bounds for reward amount
        uint256 minRewardAmount = 1000 * 1e18;  // ~$0.1
        uint256 maxRewardAmount = 10000 * 1e18;  // ~$1
        
        // get how many times a user has claimed
        uint256 totalClaims = IUBISchemeV2(0x43d72Ff17701B2DA814620735C39C620Ce0ea4A1).totalClaimsPerUser(user);

        uint256 userRewardAmount = minRewardAmount + (totalClaims * 100 * 1e18);

        if (userRewardAmount > maxRewardAmount) return maxRewardAmount;
        return userRewardAmount;
    }
}

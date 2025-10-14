// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { ICustomReward } from "../../interfaces/ICustomReward.sol";

interface IUBISchemeV2 {
    function totalClaimsPerUser(address user) external view returns (uint256 totalClaims);
}

/**
 * @title CustomReward for GoodDollar Academy exam
 * @notice Users that pass the exam are eligible for rewards but the amount they get
 * is: number of correct answers * number of times they have claimed
 */
contract CustomReward is ICustomReward {
    function getCustomRewardAmountForUser(
        address user,
        uint256 numberOfCorrectAnswers,
        uint256 /* s_rewardAmountPerPerson */,
        uint256 /* s_rewardAmountPerCorrectAnswer */
    ) external view returns (uint256){
        // set bounds for reward amount
        uint256 minRewardAmount = 1000 * 1e18;  // ~$0.1
        uint256 maxRewardAmount = 10000 * 1e18;  // ~$1
        
        // get how many times a user has voted
        uint256 totalClaims = IUBISchemeV2(0x43d72Ff17701B2DA814620735C39C620Ce0ea4A1).totalClaimsPerUser(user);

        uint256 rewardAmount = minRewardAmount + (numberOfCorrectAnswers * totalClaims * 10 * 1e18);

        if (rewardAmount > maxRewardAmount) return maxRewardAmount;
        return rewardAmount;
    }
}

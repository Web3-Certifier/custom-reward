// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { ICustomReward } from "../../interfaces/ICustomReward.sol";

struct Allocation {
    address[] accounts;
    uint128[] amounts;
}

interface ICouncil {
    function getAllocation(address _member)
        external
        view
    returns (Allocation memory allocation, uint256 sum, uint256 balance);
}

/**
 * @title CustomReward for GoodDollar Funding Round 2 voters
 * @notice Users that pass the exam are eligible for rewards but the amount they get
 * is: number of correct answers * number of votes that they have
 */
contract CustomReward is ICustomReward {
    function getCustomRewardAmountForUser(
        address user,
        uint256 numberOfCorrectAnswers,
        uint256 /* s_rewardAmountPerPerson */,
        uint256 /* s_rewardAmountPerCorrectAnswer */
    ) external view returns (uint256){
        // set bounds for reward amount
        uint256 minRewardAmount = 1;
        uint256 maxRewardAmount = 10000 * 1e18;  // ~$1
        
        // get how many votes a user has allocated
        (, uint256 allocatedVotes, ) = ICouncil(0xA4c44743582208E7e4207d5947c87AD1a0E70Aa0).getAllocation(user);

        uint256 rewardAmount = numberOfCorrectAnswers * allocatedVotes;

        if (rewardAmount < minRewardAmount) return minRewardAmount;
        if (rewardAmount > maxRewardAmount) return maxRewardAmount;
        return rewardAmount;
    }
}

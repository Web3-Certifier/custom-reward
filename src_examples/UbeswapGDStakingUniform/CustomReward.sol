// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { ICustomReward } from "../../interfaces/ICustomReward.sol";

interface IStakingRewards {
    function balanceOf(address account) external view returns (uint256);
}

/**
 * @title Ubeswap G$ Staking Uniform Distribution CustomReward
 * @notice Only users that have staked G$ are eligible for rewards
 * @notice This reward distributes the total reward pool equally among all users that submitted the exam
 * @notice Only users that pass the exam are eligible for this reward
 * @notice This means that the reward pool will have some tokens left
 * after all the users that passed the exam claim this reward,
 * because some users will fail and not claim their share
 */
contract CustomReward is ICustomReward {
    function getCustomRewardAmountForUser(
        address user,
        uint256 /* numberOfCorrectAnswers */,
        uint256 s_rewardAmountPerPerson,
        uint256 s_rewardAmountPerCorrectAnswer
    ) external view returns (uint256){
        // check if user has staked
        if (IStakingRewards(0x799a23dA264A157Db6F9c02BE62F82CE8d602A45).balanceOf(user) == 0) return 0;
        // check if the reward is set-up correctly
        if ((s_rewardAmountPerPerson == 0) || (s_rewardAmountPerCorrectAnswer == 0)) return 0;

        uint256 totalRewardAmount = s_rewardAmountPerPerson;
        uint256 totalSubmissions = s_rewardAmountPerCorrectAnswer;
        uint256 decimals = 1e18;
        uint256 rewardPerUser = totalRewardAmount * decimals / totalSubmissions;

        return rewardPerUser;
    }
}

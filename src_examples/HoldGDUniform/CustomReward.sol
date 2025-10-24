// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { ICustomReward } from "../../interfaces/ICustomReward.sol";

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
}

/**
 * @title Hold GD Uniform Distribution Custom Reward
 * @notice Users have to hold 500 G$ tokens to be eligible
 * @notice This reward distributes the total reward pool equally among all users that submitted the exam
 * @notice Only users that pass the exam are eligible for this reward
 * @notice This means that the reward pool will have some tokens left
 * after all the users that passed the exam claim this reward
 */
contract CustomReward is ICustomReward {
    /**
     * @param s_rewardAmountPerPerson This is the total amount of rewards. Should have decimals
     * @param s_rewardAmountPerCorrectAnswer This is the number of submissions. Should have decimals.
     */
    function getCustomRewardAmountForUser(
        address user,
        uint256 /* numberOfCorrectAnswers */,
        uint256 s_rewardAmountPerPerson,
        uint256 s_rewardAmountPerCorrectAnswer
    ) external view returns (uint256){
        // eligibility: must hold 500 G$
        if (IERC20(0x62B8B11039FcfE5aB0C56E502b1C372A3d2a9c7A).balanceOf(user) < 500e18) return 0;

        if ((s_rewardAmountPerPerson == 0) || (s_rewardAmountPerCorrectAnswer == 0)) return 0;

        uint256 totalRewardAmount = s_rewardAmountPerPerson;
        uint256 totalSubmissions = s_rewardAmountPerCorrectAnswer;
        uint256 decimals = 1e18;
        uint256 rewardPerUser = totalRewardAmount * decimals / totalSubmissions;

        return rewardPerUser;
    }
}

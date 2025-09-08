// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { ICustomReward } from "../../interfaces/ICustomReward.sol";
import { IStakingRewards } from "./interfaces/IStakingRewards.sol";

/**
 * @title CustomReward for Ubeswap exams
 * @notice Only users that have staked G$ are eligible for rewards
 */
contract CustomReward is ICustomReward {
    function isEligible(address user) external view returns (bool) {
        // check if user has staked
        bool hasStaked = IStakingRewards(0x799a23dA264A157Db6F9c02BE62F82CE8d602A45).balanceOf(user) > 0;
        return hasStaked;
    }

    // return 0 to use default reward amount
    function getCustomRewardAmountForUser(
        address /* user */,
        uint256 /* numberOfCorrectAnswers */,
        uint256 /* s_rewardAmountPerPerson */,
        uint256 /* s_rewardAmountPerCorrectAnswer */
    ) external pure returns (uint256){
        return 0;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { ICustomReward } from "../../interfaces/ICustomReward.sol";

interface IStakingRewards {
    function balanceOf(address account) external view returns (uint256);
}

/**
 * @title CustomReward for Ubeswap exams
 * @notice Only users that have staked G$ are eligible for rewards
 */
contract CustomReward is ICustomReward {
    function name() external pure returns (string memory) {
        return "Ubeswap G$ Staking";
    }

    function description() external pure returns (string memory) {
        return "Eligibility critereia: Must have staked G$ on Ubeswap. Distribution type: Constant (can be overridden).";
    }

    function isEligible(address user) external view returns (bool) {
        bool hasStaked = IStakingRewards(0x799a23dA264A157Db6F9c02BE62F82CE8d602A45).balanceOf(user) > 0;
        return hasStaked;
    }

    // can be overridden by organizer
    function rewardAmountForUser(address /* user */, uint256 distributionParameter) external pure returns (uint256) {
        return distributionParameter;
    }
}

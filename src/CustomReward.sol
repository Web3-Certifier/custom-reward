// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { ICustomReward } from "../interfaces/ICustomReward.sol";

contract CustomReward is ICustomReward {
    function name() external pure returns (string memory) {
        return "Custom Reward Name";
    }

    function eligibilityDescription() external pure returns (string memory) {
        return "No extra eligibility criteria.";
    }

    function distributionDescription() external pure returns (string memory) {
        return "Each user receives distributionParameter number of tokens.";
    }

    function isEligible(address /* user */) external pure returns (bool) {
        return true;
    }

    function rewardAmountForUser(address /* user */, uint256 distributionParameter) external pure returns (uint256) {
        return distributionParameter;
    }
}

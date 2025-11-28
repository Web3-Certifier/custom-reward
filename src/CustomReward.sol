// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { ICustomReward } from "../interfaces/ICustomReward.sol";

contract CustomReward is ICustomReward {
    function name() external pure returns (string memory) {
        return "Custom Reward Name";
    }

    function description() external pure returns (string memory) {
        return "Custom Reward Description";
    }

    function isEligible(address /* user */) external pure returns (bool) {
        return true;
    }

    function rewardAmountForUser(address /* user */, uint256 distributionParameter) external pure returns (uint256) {
        return distributionParameter;
    }
}

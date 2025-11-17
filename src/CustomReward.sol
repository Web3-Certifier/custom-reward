// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { ICustomReward } from "../interfaces/ICustomReward.sol";

contract CustomReward is ICustomReward {
    function isEligible(address user) external view returns (bool) {
        return true;
    }
    function rewardAmount(address user, uint256 distributionParameter) external view returns (uint256) {
        return distributionParameter;
    }
}

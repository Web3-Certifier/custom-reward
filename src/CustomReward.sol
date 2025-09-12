// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { ICustomReward } from "../interfaces/ICustomReward.sol";

contract CustomReward is ICustomReward {
    function getCustomRewardAmountForUser(
        address /* user */,
        uint256 numberOfCorrectAnswers,
        uint256 /* s_rewardAmountPerPerson */,
        uint256 s_rewardAmountPerCorrectAnswer
    ) external pure returns (uint256){
        return numberOfCorrectAnswers * s_rewardAmountPerCorrectAnswer;
    }
}

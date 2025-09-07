// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IRewardFactory {
    function createReward(
        uint256 examId,
        uint256 initialRewardAmount,
        uint256 rewardAmountPerPerson,
        uint256 rewardAmountPerCorrectAnswer,
        address tokenAddress,
        address customReward
    ) external returns (address);
}
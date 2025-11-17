// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IRewardFactory {
    enum DistributionType {CUSTOM, CONSTANT, UNIFORM}
    enum EligibilityCriteria {NONE, CUSTOM, HOLDS_TOKEN, HOLDS_NFT}
    function createReward(
        uint256 examId,
        uint256 initialRewardAmount,
        address rewardToken,
        DistributionType distributionType,
        uint256 distributionParameter,  // has 18 decimals
        EligibilityCriteria eligibilityCriteria,
        address eligibilityParameter
    ) external returns (address);
}
//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {CustomReward} from "../src/CustomReward.sol";
import {IRewardFactory} from "interfaces/IRewardFactory.sol";
import {Script, console} from "lib/forge-std/src/Script.sol";

contract DeployCustomRewardOnW3C is Script {
    function run() external returns (address) {
        vm.startBroadcast();
        address customReward = address(new CustomReward());
        console.log("Custom Reward Contract deployed at: ", customReward);
        address rewardFactory = block.chainid == 11155111 ? vm.envAddress("SEPOLIA_REWARD_FACTORY_PROXY_ADDRESS")
            : block.chainid == 42220 ? vm.envAddress("CELO_REWARD_FACTORY_PROXY_ADDRESS")
            : address(0);
        address rewardTokenAddress = block.chainid == 11155111 ? 0x779877A7B0D9E8603169DdbD7836e478b4624789  // link token
            : block.chainid == 42220 ? 0x62B8B11039FcfE5aB0C56E502b1C372A3d2a9c7A  // G$ token
            : address(0);
        address reward = IRewardFactory(rewardFactory).createReward(
            vm.envUint("EXAM_ID"),  // examId
            0,  // initialRewardAmount
            rewardTokenAddress,  // tokenAddress
            IRewardFactory.DistributionType.CUSTOM,  // distributionType
            vm.envUint("DISTRIBUTION_PARAMETER"),  // distributionParameter
            IRewardFactory.EligibilityCriteria.CUSTOM,  // eligibilityCriteria
            customReward  // eligibilityParameter
        );
        console.log("W3C Reward Contract deployed at: ", reward);
        vm.stopBroadcast();

        return customReward;
    }
}

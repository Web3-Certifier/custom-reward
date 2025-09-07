//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {CustomReward} from "../src/CustomReward.sol";
import {IRewardFactory} from "../src/interfaces/IRewardFactory.sol";
import {Script, console} from "lib/forge-std/src/Script.sol";

contract DeployCustomRewardOnW3C is Script {
    function run() external returns (address) {
        vm.startBroadcast();
        address customReward = address(new CustomReward());
        console.log("Custom Reward Contract deployed at: ", customReward);
        address rewardFactory = block.chainid == 11155111 ? vm.envAddress("SEPOLIA_REWARD_FACTORY_PROXY_ADDRESS")
            : block.chainid == 42220 ? vm.envAddress("CELO_REWARD_FACTORY_PROXY_ADDRESS")
            : vm.envAddress("ARBITRUM_REWARD_FACTORY_PROXY_ADDRESS");
        address rewardTokenAddress = block.chainid == 11155111 ? 0x779877A7B0D9E8603169DdbD7836e478b4624789  // link token
            : block.chainid == 42220 ? 0x62B8B11039FcfE5aB0C56E502b1C372A3d2a9c7A  // G$ token
            : 0xaf88d065e77c8cC2239327C5EDb3A432268e5831;  // USDC token
        address reward = IRewardFactory(rewardFactory).createReward(
            vm.envUint("EXAM_ID"),  // examId
            0,  // initialRewardAmount
            vm.envUint("REWARD_AMOUNT_PER_PERSON") * 1e18,  // rewardAmountPerPerson
            vm.envUint("REWARD_AMOUNT_PER_CORRECT_ANSWER") * 1e18,  // rewardAmountPerCorrectAnswer
            rewardTokenAddress,  // tokenAddress
            customReward  // customReward
        );
        console.log("W3C Reward Contract deployed at: ", reward);
        vm.stopBroadcast();

        return customReward;
    }
}

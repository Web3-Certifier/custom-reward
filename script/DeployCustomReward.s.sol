//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {CustomReward} from "../src/CustomReward.sol";
import {Script, console} from "lib/forge-std/src/Script.sol";

contract DeployCustomReward is Script {
    function run() external returns (address) {
        vm.startBroadcast();
        address customReward = address(new CustomReward());
        vm.stopBroadcast();
        console.log("Custom Reward Contract deployed at: ", customReward);
        return customReward;
    }
}

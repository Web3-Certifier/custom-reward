// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { ICustomReward } from "../interfaces/ICustomReward.sol";

contract CustomReward is ICustomReward {
    function name() external pure returns (string memory) {
        return "Custom Reward Name";
    }

    function description() external pure returns (string memory) {
        return "Custom Reward Descriptionrjklghefgnruiter780g3457u807uiyuih47uy57u8h785uyghrhtui4ieryiueryiueryguieryguierguiertuieryhtuierytui4rytueyt9erytiuerhtuiertyeruityeruiteruitertuierbtuiertberuitberuiyntbuierytbuierytbierutyberiteruiterueruugieriyg9eryg9eryg9eryg98erug89eru98eru9g8ue98rug89eu9er8ute908utb9e8su5bhn945ynagb7p89045atpn34t";
    }

    function isEligible(address /* user */) external pure returns (bool) {
        return true;
    }

    function rewardAmountForUser(address /* user */, uint256 distributionParameter) external pure returns (uint256) {
        return distributionParameter;
    }
}

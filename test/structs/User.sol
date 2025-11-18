// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

struct User {
    address userAddress;
    bool expectedEligible;
    uint256 expectedRewardAmount;
}
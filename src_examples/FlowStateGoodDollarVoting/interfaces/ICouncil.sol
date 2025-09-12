// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

struct Allocation {
    address[] accounts;
    uint128[] amounts;
}

interface ICouncil {
    function getAllocation(address _member)
        external
        view
    returns (Allocation memory allocation, uint256 sum, uint256 balance);
}
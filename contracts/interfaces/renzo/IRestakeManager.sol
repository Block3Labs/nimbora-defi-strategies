// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.8.20;

interface IRestakeManager {
    function deposit(IERC20 _collateralToken, uint256 _amount) external;
}
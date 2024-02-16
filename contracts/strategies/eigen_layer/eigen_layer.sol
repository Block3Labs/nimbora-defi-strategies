// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

import {StrategyBase} from "../StrategyBase.sol";

contract EigenLayerStrategy is StrategyBase {
    IStETH public stETH;
    IRestakeManager public restakeManager;

    address public constant RESTAKE_MANAGER = 0x123;

    function initialize(
        address _poolingManager,
        address _underlyingToken, // ETH Address
        address _yieldToken // StETH address
    ) public virtual initializer {
        initializeStrategyBase(_poolingManager, _underlyingToken, _yieldToken);
    }

    // On Starknet : fn initiate_withdraw(ref self: ContractState, l1_recipient: felt252, amount: u256);
    function _deposit(uint256 amount) internal override {
        require(address(this).balance != 0, "ZERO_DEPOSIT");
        // Submit to LIDO
        // https://docs.lido.fi/contracts/lido#submit-1
        stETH = IStETH(STETH);
        stETH.submit(address(0));
    }

    function _withdraw(uint256 amount) internal override returns (uint256) {}
    
}
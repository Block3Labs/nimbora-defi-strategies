// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

import {StrategyBase} from "../StrategyBase.sol";
import "../../interfaces/IStETH.sol";
import "../../interfaces/renzo/IRestakeManager.sol";

contract RenzoStrategy is StrategyBase {
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
        // Call RestakeManager.deposit(IERC20 _collateralToken, uint256 _amount, uint256 _referralId)
        // _collateralToken: stETH address
        // The msg.sender must pre-approve this contract to move the tokens into the protocol
        // https://github.com/Renzo-Protocol/contracts-public/blob/master/contracts/RestakeManager.sol
        restakeManager = IRestakeManager();
        restakeManager.deposit(yieldToken, amount);
    }

    function _withdraw(uint256 amount) internal override returns (uint256) {}
    
}
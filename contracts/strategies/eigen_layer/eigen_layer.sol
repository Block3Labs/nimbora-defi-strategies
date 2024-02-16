// // SPDX-License-Identifier: Apache-2.0
// pragma solidity ^0.8.20;

// import {StrategyBase} from "../StrategyBase.sol";
// import {IStrategyManager} from "../../interfaces/IStrategyManager.sol";

// contract EigenLayerStrategy is StrategyBase {
//     //IStETH public stETH;
//     //address(strategyManager)
//     function initialize(
//         address _poolingManager,
//         address _underlyingToken, // ETH Address
//         address _yieldToken, // StETH address
//         IStrategyManager _strategyManager
//         //IERC20 token
//     ) public virtual initializer {
//         initializeStrategyBase(_poolingManager, _underlyingToken, _yieldToken);
//         _strategyManager = _strategyManager;
//     }

//     // On Starknet : fn initiate_withdraw(ref self: ContractState, l1_recipient: felt252, amount: u256);
//     function _deposit(uint256 amount) internal override {
//        // require(address(this).balance != 0, "ZERO_DEPOSIT");
//         // Submit to LIDO
//         // // https://docs.lido.fi/contracts/lido#submit-1
//         // stETH = IStETH(STETH);
//         // stETH.submit(address(0));

//         //_assertOnlyPoolingManager_strategyManager.depositIntoStrategy(address(this), IERC20(address(underlyingToken)), amount);
//     }

//     function _withdraw(uint256 amount) internal override returns (uint256) {}
// }

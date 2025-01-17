// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.12;

import "../../contracts/interfaces/IStrategyManager.sol";
import "../../contracts/interfaces/IStrategy.sol";
import "../../contracts/interfaces/IDelegationManager.sol";
import "../../contracts/interfaces/ISignatureUtils.sol";

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

//import "forge-std/Test.sol";

contract Staker is Ownable {
    constructor(
        IStrategy strategy,
        IStrategyManager strategyManager,
        IDelegationManager delegation,
        IERC20 token,
        uint256 amount,
        address operator
    ) Ownable(address(strategyManager)) {
        token.approve(address(strategyManager), type(uint256).max);
        strategyManager.depositIntoStrategy(strategy, token, amount);
        ISignatureUtils.SignatureWithExpiry memory signatureWithExpiry;
        delegation.delegateTo(operator, signatureWithExpiry, bytes32(0));
    }

    function callAddress(address implementation, bytes memory data) external onlyOwner returns (bytes memory) {
        uint256 length = data.length;
        bytes memory returndata;
        assembly {
            let result := call(gas(), implementation, callvalue(), add(data, 32), length, 0, 0)
            mstore(returndata, returndatasize())
            returndatacopy(add(returndata, 32), 0, returndatasize())
        }

        return returndata;
    }
}

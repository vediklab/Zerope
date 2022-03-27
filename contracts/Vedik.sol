//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Vedik {
    mapping (address=>uint) balance;

    function getBalance() public view returns(uint){
        return balance[msg.sender];
    }


    function witdraw(uint amt) public {
        require(amt <= balance[msg.sender]);
        balance[msg.sender] -= amt;
        payable(msg.sender).transfer(amt);
    }

    function deposit() public payable {
        balance[msg.sender] += msg.value;
    }
}

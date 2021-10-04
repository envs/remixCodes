// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.3;

contract SimpleStorage {
    
    // /**
    //  * To write or update a state variable, you need a transaction.
    //  * On the other hand, you can read state variables for free, without any transaction fee.
    //  * /
    
    // State variable to store a number
    uint public num;
    
    // You need a transaction to write to a state variable
    function set(uint _num) public {
        num = _num;
    }
    
    // You can read from a state variable without send a transaction
    function get() public view returns(uint) {
        return num;
    }
}
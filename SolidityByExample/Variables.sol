// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.3;

contract Variables {
    // /**
    //  * There are 3 types of variables in Solidity
    //  *      => Local:
    //  *          - Declared inside a function
    //  *          - Not stored on the blockchain
    //  *      => State
    //  *          - Declared outside a function
    //  *          - Stored on the blockchain
    //  *      => Global (provides information about the blockchain)
    //  * /
    
    // State variables
    string public text = "Hello";
    uint public num = 123;
    
    function doSomething() public view {
        // Local variables
        uint i = 456;
        
        // Here are some global variables
        uint timestamp = block.timestamp;   // current block timestamp
        address sender = msg.sender;        // address of the caller (sender)
    }

}
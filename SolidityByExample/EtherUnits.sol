// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.3;

contract EtherUnits {
    uint public oneWei = 1 wei;
    // 1 wei is equal to 1
    bool public isOneWei = 1 wei == 1;
    
    uint public oneEther = 1 ether;
    // 1 ether is equal to 10^18 wei
    bool public isOneEther = 1 ether == 1e18;
    
}

// /**
//  * How much ether do you need to pay for a transaction: You pay "gas spent x gas price" amount of ether
//  *      > gas - is a unit of computation
//  *      > gas spent - is the total amount of gas used in a transaction
//  *      > gas price - is how much ether you are willing to pay per gas
//  * 
//  * NB: Transactions with higher gas price have higher priority to be included in a block.
//  * Unspent gas will be refunded
//  * 
//  * ==> Gas Limit
//  * There are 2 upper bounds to the amount of gas you can spend:
//  *      > gas limit: The maximum amount of gas you are willing to use for your transaction, st by you
//  *      > block gas limit: The maximum amount of gas allowed in a block, set by the network
//  * /
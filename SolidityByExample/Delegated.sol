// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.3;

/**
 * DELEGATECALL:
 * delegatecall is a low-level function similar to call.
 * - When contract A executes delegatecall to contract Delegated, Delegated's code is executed with contract A's storage, msg.sender & msg.value
 */ 
 
 contract Delegated {
     
     // NB: storage layout must be the same as contract A
     uint public num;
     address public sender;
     uint public value;
     
     function setVars(uint _num) public payable {
         num = _num;
         sender = msg.sender;
         value = msg.value;
     }
 }
 
 contract A {
     
     uint public num;
     address public sender;
     uint public value;
     
     function setVars(address _contract, uint _num) public payable {
         // A's storage is set, Delegated is not modified.
         (bool success, bytes memory data) = _contract.delegatecall(
             abi.encodeWithSignature("setVars(uint256)", _num)
        );
     }
 }
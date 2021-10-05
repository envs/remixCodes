// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.3;

/**
 * fallback() is a function that doesn't take any argument and does not return anything.
 * It's executed either when:
 *      > a function that doesn't exist is called or,
 *      > Ether is sent directly to a contract but receive() doesn't exist or msg.data is not empty
 * 
 * NB: fallback() has a 2300 gas limit when called by transfer() or send()
 */ 
 
 contract Fallback {
     
     event Log(uint gas);
     
     // Function to receive Ether: msg.data must be empty
    receive() external payable {}
     
     // Fallback function must be declared as external
     fallback() external payable {
         // send / transfer (forwards 2300 gas to this fallback() function)
         // call (forwards all of the gas)
         emit Log(gasleft());
     }
     
     // Helper function to check the balance of this contract
     function getBalance() public view returns (uint) {
         return address(this).balance;
     }
 }
 
 
 contract SendToFallback {
     
     function transferToFallback(address payable _to) public payable {
         _to.transfer(msg.value);
     }
     
     function callFallback(address payable _to) public payable {
         (bool sent, ) = _to.call{value: msg.value}("");
         require(sent, "Failed to send Ether");
     }
 }
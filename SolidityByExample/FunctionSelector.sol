// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.3;

/**
 * When a funtion is called, the first 4 bytes of calldata specifies which function to call.
 * This 4 bytes is called a FUNCTION SELECTOR.
 * E.g. 
 * From the code below, it uses 'call' to execute 'transfer' on a contract at the address 'addr'
 *              addr.call(abi.encodeWithSignature('transfer(address,uint256)', 0xSomeAddress, 123))
 * >> The first 4 bytes returned from abi.encodeWithSignature(...) is the function selector.
 * 
 * NB: Maybe you can save a tiny amount of gas if you precompute and inline the function selector in your code.
 * 
 * Here is how the functino selector is computed:
 */ 
 
 contract FunctionSelector {
     
     /*
     "transfer(address, uint256)"
     0xa90059cbb
     "transferFrom(address, address, uint256)"
     0x23b872dd
     */
     function getSelector(string calldata _func) external pure returns (bytes4) {
         return bytes4(keccak256(bytes(_func)));
     }
 }
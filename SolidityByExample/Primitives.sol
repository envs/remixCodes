// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.3;

contract Primitives {
    bool public boo = true;
    
    // Unsigned integer only contain positive numbers (or zero)
    uint8 public u8 = 1;
    uint public u256 = 456;
    uint public u = 123; // uint same thing as uint256
    
    // Signed integer contains both -ve and +ve numbers
    int8 public i8 = -1;
    int public i256 = 456;
    int public i = -123; // int same thing as int256
    
    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
    
    // Default values
    // NB: Unassigned variables have a default value
    bool public defaultBoo;     // false
    uint public defaultUint;    // 0
    int public defaultInt;      // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
}
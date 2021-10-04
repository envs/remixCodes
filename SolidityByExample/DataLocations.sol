// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.3;

/**
 * Variables are declared as either STORAGE, MEMORY, or CALLDATA to explicitly specify the location of the data
 *      > storage: Storage in Solidity holds data between function calls
 *      > memory: Memory in Solidity is a temporary place to store data.
 *                Variable here exist while a function is being called
 *      > calldata: is a non-modifiable & non-persistent data location where all passing values to a function are stored
 *                  It's a special data location that contains function arguments, only available for external functions.
 */ 

contract DataLocations {
    
    uint[] public arr;
    mapping(uint => address) map;
    struct MyStruct {
        uint foo;
    }
    mapping(uint => MyStruct) myStructs;
    
    function f() public {
        // call _f with state variables
        _f(arr, map, myStructs[1]);
        
        // get a struct from a mapping
        MyStruct storage myStruct = myStructs[1];
        
        // create a struct in memory
        MyStruct memory myMemStruct = MyStruct(0);
    }
    
    function _f(
        uint[] storage _arr,
        mapping(uint => address) storage _map,
        MyStruct storage _myStruct
        ) internal {
        // do something with storage variables
    }
    
    // You can return memory variables
    function g(uint[] memory _arr) public returns (uint[] memory) {
        // do something with memory array
    }
    
    function h(uint[] calldata _arr) external {
        // do something with calldata array
    }
}
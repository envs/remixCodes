// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.3;

/**
 * VISIBILITY:
 * 
 * A function and state variables have to declare whether they are accessible by other contracts.
 * 
 * Functions can be declared as:
 *      > public - any contract and account can call
 *      > private - only entities defined inside the same contract, that defines the function, can call it
 *      > internal - only inside contract that inherits the "internal" function
 *      > external - only other contracts and accounts can call.
 * 
 * NB: State variables can be declared as public, private, or internal; but not external
 */ 
 
 contract Base {
     
     // "Private" function can only be called inside this contract
     // Contracts that even inherit this contract cannot call this function.
     function _privateFunc() private pure returns (string memory) {
         return "private function called";
     }
     
     function testPrivateFunc() public pure returns (string memory) {
         return _privateFunc();
     }
     
     // "Internal" function can be called:
     //     * inside this contract
     //     * inside contracts that inherit this contract
     function internalFunc() internal pure returns (string memory) {
         return "internal function called";
     }
     
     function testInternalFunc() public pure virtual returns (string memory) {
         return internalFunc();
     }
     
     // "Public" function can be called:
     //     * inside this contract
    //      * inside contracts that inherit this contract
    //      * by other contracts and accounts
    function publicFunc() public pure returns (string memory) {
        return "public function called";
    }
    
    // "External" function can only be called by OTHER contracts and accounts
    function externalFunc() external pure returns (string memory) {
        return "external function called";
    }
    
    /**
     * NB: This function will not compile since we are trying to call an external function here (in the same contract)
     * function testExternalFunc() public pure returns (string memory) {
         return externalFunc();
     }
     */ 
    
    // State Variables
    string private privateVar = "my private variable";
    string internal internalVar = "my internal variable";
    string public publicVar = "my public variable";
    //string external externalVar = "my external variable"; -> // State variables cannot be external, so this code won't compile
 }
 
 
 contract Child is Base {
     
     // Inherited contracts don't have access to private functions and private state variables
     // Internal function can be called inside child contracts
     function testInternalFunc() public pure override returns (string memory) {
         return internalFunc();
     }
 }
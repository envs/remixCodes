// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.3;

contract Function {
    
    // Functions can return multiple values
    function returnMany() public pure returns (uint, bool, uint) {
        return (1, true, 2);
    }
    
    // The return values can be named
    function named() public pure returns (uint x, bool b, uint y) {
        return (1, true, 2);
    }
    
    // Return values can be assigned to their name. In this case, the return statement can be ommitted
    function assigned() public pure returns(uint x, bool b, uint y) {
        x = 1;
        b = true;
        y = 2;
    }
    
    // Use destructuring assigned when calling another function that returns multiple values
    function destructuringAssignment() public pure returns(uint, bool, uint, uint, uint) {
        (uint i, bool b, uint j) = returnMany();
        
        // Values can be. left out
        (uint x, , uint y) = (4, 5, 6);
        
        return (i, b, j, x, y);
    }
    
    // NB: Cannot use map for nether input nor output
    
    // Can use array for input
    function arrayInput(uint[] memory _arr) public {}
    
    // Can use array for output
    uint[] public arr;
    
    function arrayOutput() public view returns (uint[] memory) {
        return arr;
    }
}

/**
 * Getter functions can be declared "view" or "pure"
 *      > View function declares that no state will be changed
 *      > Pure function declares that no state variable will be changed or read
 * 
 * There are two ways you can pass an argument to a Solidity function:
 *      > By Value - which means the solidity compiler creates a new copy of the parameter's value and passes it to the function.
 *      > By Reference - whihc means that your function is called with a ... reference to the original variable.
 */
 
 
 // CONSTRUCTOR
 /**
  * A contructor is an optional function that is executed upon contract creation
  * 
  * // Base Contract X
  * contract X {
      string public name;
      
      constructor (string memory _name) {
          name = _name;
      }
  }
  
  // Base Contract Y
  contract Y {
      string name text;
      
      constructor (string memory _text) {
          text = _text;
      }
  }
  
  // There are 2 ways to initialize parent contract with parameters:
  
  1. Pass the parameters here in the inheritance list
  
  contract B is X("Input to X"), Y("Input to Y"){
      //
  }
  
  2. pass the parameters in the constructor, similar to function modifiers
  contract C is X, Y {
      constructor(string memory _name, string memory _text) X(_name) Y(_text){
          //
      }
  }
  
  * 
  * NB: Parent constructors are always called in the order of inheritance, regardless of the order of parent contracts listed in
  * the constructpr of the child contract.
  * 
  * // Order of constructors called:
  * 1. Y
  * 2. X
  * 3. D
  * contract D is X, Y {
      constructors() X("X was called") Y("Y was called") {
          //
      }
  }
  // Order of constructors called:
  * 1. Y
  * 2. X
  * 3. E
  contract E is X, Y {
      constructors() Y("Y was called") X("X was called") {
          //
      }
  }
  */ 
  
  
  
  // INHERITANCE
  /**
   * > Solidity supports multiple inheritance.
   * > Contracts can inherit other contract by using the 'is' keyword.
   * > Function that is going to be overridden by a child contract must be declared as "virtual"
   * > Function that is going to override a parent function must use the keyword ""override"
   * > Order of inheritance is important
   * 
   Graph of Inheritance:
        A
      /  \
     B    C
    / \   /
   F   D,E
   
   contract A {
       function foo() public pure virtual returns (string memory) {
           return "A";
       }
   }
   
   contract B is A {
       // Override A.foo()
       function foo() public pure vitual override returns (string memory) {
           return "B";
       }
   }
   
   contract C is A {
       // Override A.foo()
       function foo() public pure vitual override(B,C) returns (string memory) {
           return "C";
       }
   }
   
   // Contracts can inherit from multiple parent contracts
   // When a function is called that is defined multiple times in different contracts, parent contracts are serched from 
   // right to left, and in depth-first manner
   contract D is B, C {
       // D.foo() returns "C" - since C is the right most parent contract with function foo()
       return super.foo();
   }
   
   contract E is C, B {
       E.foo() returns "B" - since B is the right most parent contract with function foo()
       function foo() public pure override(C,B) returns (string memory) {
           return super.foo();
       }
   }
   
   // Inheritance must be ordered from "most base-like" to "most derived". Swapping the order A and B will throw a compilation error.
   contract F is A, B {
       function foo() public pure override(A,B) returns (string memory) {
           return super.foo();
       }
   }
   */ 
   
   
   // Shadowing Inherited State Variables
   /**
    * Unlike functions, state variables cannot be overriden by re-declaring it in the child contract
    * Let's see how to correctly "override inherited" state variables
    * 
    * contract A {
        string public name = "Contract A";
        
        function getName() public view returns (string memory) {
            return name;
        }
    }
    
    // Shadowing is disallowed in Solidity 0.6, hence the following will not compile:
    contract B is A { string public name = "Contract B"; }
    
    //This is the way to correctly override inherited state variables:
    contract C is A {
        constructor () {
            name = "Contract C";
        }
    }
    // C.getName returns "Contract C"
    */ 
    
    
    /**
     * NB: Parent contracts can be called directly, or by using hte keyword "super".
     * i.e. you can say A.foo() or super.foo() in contract B() {...} E.g.
     * 
     * contract A {
     *   event Log(string message);
     * 
         function foo() public virtual {
             emit Log("A.foo called");
         }
     }
     
     contract B is A{
         function foo() public virtual override {
             emit Log("B.foo called");
             A.foo();
         }
     }
     
     contract C is A{
         function foo() public virtual override {
             emit Log("C.foo called");
             super.foo();
         }
     }
     */ 
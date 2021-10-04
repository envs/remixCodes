// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.3;

// NB: Enum can be declared outside of a contract

contract Enum {
    
    // Enum representing shipping status
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }
    
    // Default value of an enum is the first element listed in the definitiong of 
    // the type, in this case "Pending"
    Status public status;
    
    // Returns uint (i.e. Pending - 0, Shipped - 1, Accepted - 2, etc.)
    function get() public view returns(Status) {
        return status;
    }
    
    // Update status by passing uint into input
    function set(Status _status) public {
        status = _status;
    }
    
    // You can update a specific enum like this
    function cancel() public {
        status = Status.Canceled;
    }
    
    // delete resets the enum to its first value, 0
    function reset() public {
        delete status;
    }
}

/**
 * You can delare enum in a file and import it for use in another file. For example:
 * 
 * // File EnumDeclaration.sol
 * pragma solidity ^0.8.3;
 * 
 * enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }
 *
 * 
 * // File Enum.sol
 * pragma solidity ^0.8.3;
 * 
 * import "./EnumDeclaration.sol";
 * 
 * contract Enum {
     Status public status;
 }
 */ 
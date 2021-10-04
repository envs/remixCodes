// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.3;

/**
 * You can define your own type by creating a struct
 * They are useful for grouping together data
 * Structs can be declared outside of a contract and imported in another contract
 */ 

contract Todos {
    
    struct Todo {
        string text;
        bool completed;
    }
    
    // An array of 'Todo' structs
    Todo[] public todos;
    
    function create(string memory _text) public {
        // 3 ways to initialize a struct
        
        // A. Calling it like a function
        todos.push(Todo(_text, false));
        
        // B. Key Value Mapping
        todos.push(Todo({text: _text, completed: false}));
        
        // C. Initialize an empty struct and then update it
        Todo memory todo;
        todo.text = _text;
        // todo.completed initialized to false
        todos.push(todo);
    }
    
    // NB: Solidity AUTOMATICALLY create a getter for "todos" (since it's declared with "public"),
    // so you don't actually need the function declared below:
    function get(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }
    
    // Update text
    function update(uint _index, string memory _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }
    
    // Update completed
    function toggleCompleted (uint _index) public {
        Todo storage todo  = todos[_index];
        todo.completed = !todo.completed;
    }
}

/**
 * You can delare struct in a file and import it for use in another file. For example:
 * 
 * // File StructDeclaration.sol
 * pragma solidity ^0.8.3;
 * 
 * struct Todo {
        string text,
        bool completed,
    }
 *
 * 
 * // File Todos.sol
 * pragma solidity ^0.8.3;
 * 
 * import "./StructDeclaration.sol";
 * 
 * contract Todos {
     Todo[] public todos;
 }
 */ 
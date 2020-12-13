pragma solidity ^0.5.0;

contract TodoList {
    uint public taskCount = 0;
    
    struct Task {
        uint id;
        string content;
        bool completed;
    }
    
    mapping (uint => Task) public tasks;
    
    constructor() public {
        createTask("Pirmasis darbas paleidus programa");
    }
    
    function createTask(string memory _contect) public {
        taskCount ++;
        tasks[taskCount] = Task(taskCount, _contect, false);
    }
}
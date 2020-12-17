pragma solidity ^0.5.0;

contract TodoList {
    uint public taskCount = 0;
    
    struct Task {
        uint id;
        string content;
        bool completed;
        address creator;
    }
    
    mapping (uint => Task) public tasks;

    event TaskCreated(
        uint id,
        string content,
        bool completed,
        address creator
    );
    
    event TaskCompleted(
        uint id,
        bool completed
    );

    constructor() public {
        createTask("First task that is auto");
    }
    
    function createTask(string memory _content) public {
        taskCount ++;
        tasks[taskCount] = Task(taskCount, _content, false, msg.sender);
        emit TaskCreated(taskCount, _content, false, msg.sender);
    }

    function toggleCompleted(uint _id) public {
        Task memory _task = tasks[_id];
        if(_task.creator != msg.sender)
        {
            _task.completed = !_task.completed;
            tasks[_id] = _task;
            emit TaskCompleted(_id, _task.completed);
        }
        
    }
}
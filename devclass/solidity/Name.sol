pragma solidity ^0.5.1;

contract Name {

    string public name;
    bool locked = false;

    function setName (string memory n) public {
        require(!locked);
        
        name = n;
    }
    
    function lock() public {
        locked = true;
    }
}

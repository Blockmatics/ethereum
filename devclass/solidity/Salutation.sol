pragma solidity ^0.5.1;

contract Salutation {

    string public salutation;
    bool locked = false;

    function setName (string memory s) public {
        require(!locked);
        
        salutation = s;
    }
    
    function lock() public {
        locked = true;
    }
}

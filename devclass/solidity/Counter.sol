pragma solidity ^0.4.0;

contract Counter {
    uint public count;
    
    function () public {
          count++;
    }
    
    function reset() public {
          count = 0;
    }
}

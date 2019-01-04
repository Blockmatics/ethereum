pragma solidity ^0.4.0;

contract SimpleDouble 
{
    int public x = 11;
    address oneWhoDeployedThisContract = msg.sender;
    
    function doubleIt ( int y ) public
    {
        if ( msg.sender == oneWhoDeployedThisContract )
          x = y * 2; 
        else
          x = 0;
    }
}

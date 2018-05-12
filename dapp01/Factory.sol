pragma solidity ^0.4.0;

contract Factory {
    
    address[] contracts;
  
    function createContract (bytes32 name) public {
        address newContract = new SimpleContract(name);
        contracts.push(newContract);
    } 

    function getContractName (uint i) public constant returns (bytes32){
        require (i < contracts.length);
        
        SimpleContract sc = SimpleContract(contracts[i]);
        return sc.name();
    }
}

contract SimpleContract {
    bytes32 public name;

    function SimpleContract (bytes32 _name) public {
        name = _name;
    }
}

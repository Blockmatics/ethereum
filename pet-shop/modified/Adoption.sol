pragma solidity ^0.4.17;

contract Adoption {

  address[16] public adopters;

  // Adopting a pet
  function adopt(uint petId) public returns (uint) {
    require(petId >= 0 && petId <= 15);

    adopters[petId] = msg.sender;

    return petId;
  }

  function reset() public {
    for (uint i = 0; i <= 15; i++)
        adopters[i] = 0x0;   
  }

  // Retrieving the adopters
  function getAdopters() public view returns (address[16]) {
    return adopters;
  }
}

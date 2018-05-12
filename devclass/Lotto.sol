pragma solidity ^0.4.11;

contract Lotto{
    
    uint constant public maxTickets = 5;
    uint public currentTickets = 0;
    
    // mapping(key=>value) 
    mapping(uint=>address) participants;
    
    event logString(string x);
    event logUint(uint x);
    event logAddress(address x);
    
    // there are an infinite number of rounds (just like a real lottery that takes place every week). `blocksPerRound` decides how many blocks each round will last. 6800 is around a day.

    uint constant public ticketPrice = .1 ether;
    // the cost of each ticket is .1 ether.
    
    function rand() private view returns(uint) { 
        uint decisionBlockHash = uint(block.blockhash(block.number-1));
        return decisionBlockHash%maxTickets;
    }

    function payout() public {
        // Game is over
        require(currentTickets == maxTickets);
        
        // Calulate winner
        uint winner = rand(); // NOT REALLY RANDOM
        
        // Set your state BEFORE sending any money!
        currentTickets = 0;
        
        // Send money to the winner
        participants[winner].transfer(ticketPrice*maxTickets);
        
        logString("Winner prize sent:");
        logUint(winner);
        logString("Winner address:");
        logAddress(participants[winner]);
    }

    function buyTicket() public payable{
        // msg.sender == address of the sender
        // msg.value == money that was sent
        require(msg.value == ticketPrice);
        
        if (currentTickets == maxTickets){
            payout();
        }
        participants[currentTickets] = msg.sender;
        currentTickets = currentTickets + 1;
        logString("A ticket was added");
        logUint(currentTickets);
    }
     
}

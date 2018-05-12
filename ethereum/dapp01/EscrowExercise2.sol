pragma solidity ^0.4.0;

contract Escrow {
	address seller;
	address buyer;
        uint public price;
	enum State { Created, Confirmed, Disabled }
	State public state;
	
	modifier onlySeller() { 
        require(msg.sender == seller);
        _;
    }
    
    modifier onlyBuyer() { 
        require(msg.sender == seller);
        _;
    }
    
    modifier inState (State s) { 
        require(state == s);
        _;
    }
	
	function Escrow () public payable {
		seller = msg.sender;
		price = msg.value / 2 ;
	}
	
	function confirmPurchase() public payable inState(State.Created) {
		require (msg.value == 2 * price);
		buyer = msg.sender;
		state = State.Confirmed;

	}
	
	function confirmReceived() public onlyBuyer inState(State.Confirmed){
		buyer.transfer (price);
		seller.transfer (this.balance);
		state = State.Disabled;
	}

	function refundBuyer() public onlySeller inState(State.Confirmed){
		buyer.transfer (2 * price);
		seller.transfer (this.balance);
		state = State.Disabled;
	}
}

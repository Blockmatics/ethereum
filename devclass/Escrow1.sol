pragma solidity ^0.4.0;

contract Escrow {
	address seller;
	address buyer;
	uint price;
	enum State { Created, Confirmed, Disabled }
	State state;
	
	function Escrow () public payable {
		seller = msg.sender;
		price = msg.value / 2 ;
	}
	
	function confirmPurchase() public payable{
		require (state == State.Created);
		require (msg.value == 2 * price);
		buyer = msg.sender;
		state = State.Confirmed;

	}
	
	function confirmReceived() public {
		require (state == State.Confirmed);
		require (msg.sender == buyer);

		buyer.transfer (price);
		seller.transfer (this.balance);
		state = State.Disabled;
	}

	function refundBuyer() public{
		require (state == State.Confirmed);
		require (msg.sender == seller);

		buyer.transfer (2 * price);
		seller.transfer (this.balance);
		state = State.Disabled;
	}
}

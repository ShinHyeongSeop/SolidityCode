pragma solidity 0.6.6;

contract ReturnCall {
	mapping(address=>uint) public balances;

	function deposit() public payable {
		balances[msg.sender]+=msg.value;
	}

	function withdraw(uint _amount) public {
		if(balances[msg.sender] >= _amount) {
			balances[msg.sender]-=_amount;
			msg.sender.call{value : _amount}("");
		}
	}
	
}
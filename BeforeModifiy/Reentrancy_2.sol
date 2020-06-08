pragma solidity 0.6.6;

contract crossFunctionReentrance{
	mapping (address => uint) private userBalances;

	function transfer(address to, uint _amount) public{
		if(userBalances[msg.sender] >= _amount) {
			userBalances[to] += _amount;
			userBalances[msg.sender] -= _amount;
		}
	}

	function withdrawAll() public{
		uint amount = userBalances[msg.sender];
		(bool success,) = msg.sender.call.value(amount)("");
		require(success);
			userBalances[msg.sender]=0;
	}
}

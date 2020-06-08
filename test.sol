//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.24 <0.7.0;

contract Help {
	address payable public rich;
	uint public most;

	constructor() public payable {
		rich = msg.sender;
		most = msg.value;
	}

	function becomeRichest() public payable{
		require(msg.value > most , "Not enough");
		rich.transfer(msg.value);
		rich = msg.sender;
		most = msg.value;
	}
}
